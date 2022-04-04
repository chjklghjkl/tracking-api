<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTimesheetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('timesheets', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(\App\Models\User::class)->constrained()->cascadeOnDelete();
            $table->dateTimeTz('start');
            $table->dateTimeTz('end')->nullable()->default(NULL);
            $table->string("start_ip_address")->nullable()->default(NULL);
            $table->string("end_ip_address")->nullable()->default(NULL);
            $table->string("start_user_agent")->nullable()->default(NULL);
            $table->string("end_user_agent")->nullable()->default(NULL);
            $table->enum('status', ['0', '1'])->default(1)->comment("0-Deleted, 1-Active");
            $table->string('deleted_user_id')->nullable();
            $table->timestamps();

           // $table->foreign('user_id')->references('id')->on(\App\Models\User::class)->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('timesheets');
    }
}
