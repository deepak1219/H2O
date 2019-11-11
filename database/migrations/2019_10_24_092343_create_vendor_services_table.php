<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendorServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendor_services', function (Blueprint $table) {
            $table->bigIncrements('id');
			$table->unsignedBigInteger('vendor_id');
			$table->unsignedBigInteger('water_cat_id');
			$table->unsignedBigInteger('water_brand_id');
			$table->double('water_no_litres', 8, 2);
			$table->double('actual_amount', 10, 2);
			$table->double('tax_amount', 10, 2);
			$table->boolean('is_active')->default(false);
            $table->timestamps();
			
			$table->foreign('vendor_id')->references('id')->on('vendor_contacts');
			$table->foreign('water_cat_id')->references('id')->on('water_categories');
			$table->foreign('water_brand_id')->references('id')->on('water_brands');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vendor_services');
    }
}
