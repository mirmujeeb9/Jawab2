<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTypeToDictTable extends Migration
{
    public function up()
    {
        Schema::table('dict', function (Blueprint $table) {
            $table->string('type')->after('content'); // Add 'type' field
        });
    }

    public function down()
    {
        Schema::table('dict', function (Blueprint $table) {
            $table->dropColumn('type'); // Remove 'type' field on rollback
        });
    }
}
