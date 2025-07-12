<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('datamhs', function (Blueprint $table) {
            $table->id();
            $table->integer('nim');
            $table->string('nama');
            $table->date('tanggal');
            $table->string('status');
            $table->integer('checklist_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('datamhs');
    }
};