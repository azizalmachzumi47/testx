<?php

namespace App\Http\Controllers;

use App\Models\Datamhs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class Datamhs_apiController extends Controller
{
    public function index()
    {
        $mahasiswa = Datamhs::all();
        return response()->json($mahasiswa);
    }

    public function show($id)
    {
        $mahasiswa = Datamhs::find($id);

        if (!$mahasiswa) {
            return response()->json(['message' => 'Mahasiswa tidak ditemukan'], 404);
        }

        return response()->json($mahasiswa);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nim' => 'required|unique:datamhs,nim',
            'nama' => 'required',
            'tanggal' => 'required|date',
        ]);

        $mahasiswa = Datamhs::create($validated);
        return response()->json($mahasiswa, 201);
    }

    public function update(Request $request, $id)
    {
        $mahasiswa = Datamhs::find($id);

        if (!$mahasiswa) {
            return response()->json(['message' => 'Mahasiswa tidak ditemukan'], 404);
        }

        $validated = $request->validate([
            'nim' => 'required|unique:datamhs,nim,' . $mahasiswa->id,
            'nama' => 'required',
            'tanggal' => 'required|date',
            'status' => 'nullable|string',
            'checklist_id' => 'nullable|string',
        ]);

        $mahasiswa->update($validated);
        return response()->json($mahasiswa);
    }

    public function destroy($id)
    {
        $mahasiswa = Datamhs::find($id);

        if (!$mahasiswa) {
            return response()->json(['message' => 'Mahasiswa tidak ditemukan'], 404);
        }

        $mahasiswa->delete();
        return response()->json(['message' => 'Data mahasiswa berhasil dihapus']);
    }

    public function searchByName($name)
    {
        $mahasiswa = Datamhs::where('nama', 'like', '%' . $name . '%')->get();

        if ($mahasiswa->isEmpty()) {
            return response()->json(['message' => 'Mahasiswa dengan nama ' . $name . ' tidak ditemukan'], 404);
        }

        return response()->json($mahasiswa);
    }

    public function searchByNim($nim)
    {
        $mahasiswa = Datamhs::where('nim', $nim)->first();

        if (!$mahasiswa) {
            return response()->json(['message' => 'Mahasiswa dengan NIM ' . $nim . ' tidak ditemukan'], 404);
        }

        return response()->json($mahasiswa);
    }

    public function searchByDate($date)
    {
        $mahasiswa = Datamhs::where('tanggal', $date)->get();

        if ($mahasiswa->isEmpty()) {
            return response()->json(['message' => 'Mahasiswa dengan tanggal ' . $date . ' tidak ditemukan'], 404);
        }

        return response()->json($mahasiswa);
    }

    public function fetchData()
    {
        $response = Http::get('https://ogienurdiana.com/career/ecc694ce4e7f6e45a5a7912cde9fe131');

        if ($response->successful()) {
            $data = $response->json();

            $raw = $data['DATA'];

            $rows = explode("\n", trim($raw));

            $header = explode("|", array_shift($rows));

            $result = [];

            foreach ($rows as $row) {
                $cols = explode("|", $row);
                $mapped = array_combine($header, $cols);

                $result[] = [
                    'YMD' => $mapped['YMD'] ?? '',
                    'NIM' => $mapped['NIM'] ?? '',
                    'NAMA' => $mapped['NAMA'] ?? '',
                ];
            }

            return response()->json($result);
        } else {
            return response()->json(['error' => 'Unable to fetch data'], 400);
        }
    }

    public function showSelected(Request $request)
    {
        $checklistIds = $request->input('checklist_id');

        if (!is_array($checklistIds) || empty($checklistIds)) {
            return response()->json([
                'message' => 'Mohon kirimkan array checklist_id.'
            ], 400);
        }

        $mahasiswa = Datamhs::whereIn('checklist_id', $checklistIds)->get();

        return response()->json([
            'data' => $mahasiswa
        ]);
    }

    public function updateByChecklistId(Request $request)
    {
        $checklistIds = $request->input('checklist_id');

        if (!$checklistIds || !is_array($checklistIds)) {
            return response()->json([
                'message' => 'checklist_id harus berupa array dan tidak boleh kosong.'
            ], 400);
        }

        $data = array_filter($request->only(['nim', 'nama', 'tanggal', 'status']), function ($value) {
            return !is_null($value);
        });

        if (empty($data)) {
            return response()->json([
                'message' => 'Tidak ada data yang dikirim untuk diupdate.'
            ], 400);
        }

        $mahasiswa = Datamhs::whereIn('checklist_id', $checklistIds)->get();

        if ($mahasiswa->isEmpty()) {
            return response()->json([
                'message' => 'Mahasiswa tidak ditemukan',
                'debug_checklist_id' => $checklistIds
            ], 404);
        }

        $updated = Datamhs::whereIn('checklist_id', $checklistIds)->update($data);

        return response()->json([
            'message' => 'Data berhasil diupdate.',
            'updated_count' => $updated
        ]);
    }

    public function deleteByChecklist(Request $request)
    {
        $checklistIds = $request->input('checklist_id');

        if (!$checklistIds) {
            return response()->json(['message' => 'checklist_id diperlukan'], 400);
        }

        $ids = is_array($checklistIds) ? $checklistIds : [$checklistIds];

        $deleted = Datamhs::whereIn('checklist_id', $ids)->delete();

        return response()->json([
            'message' => 'Data berhasil dihapus.',
            'deleted_count' => $deleted
        ]);
    }
}