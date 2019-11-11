<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendorContactsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendor_contacts', function (Blueprint $table) {
            $table->bigIncrements('id');
			$table->unsignedBigInteger('user_id');
            $table->string('business_name')->unique();
            $table->string('registration_no')->unique();
            $table->string('contact_no', 20);
            $table->string('contact_no_alternate', 20)->nullable();
            $table->mediumText('address');
            $table->geometry('position');
            $table->json('timings')->nullable();
            $table->boolean('is_active')->default(false);
            $table->timestamps();
			
			$table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vendor_contacts');
    }
}
