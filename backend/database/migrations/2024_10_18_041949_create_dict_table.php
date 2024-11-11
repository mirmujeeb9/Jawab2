<?php 

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDictTable extends Migration
{
    public function up()
    {
        Schema::create('dict', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('content');
            $table->date('date_created');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('dict');
    }
}
