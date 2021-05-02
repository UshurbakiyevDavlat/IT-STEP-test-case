<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Let's truncate our existing records to start from scratch.
        Product::query()->truncate();

        $faker = \Faker\Factory::create();

        // And now, let's create a few articles in our database:
        for ($i = 0; $i < 10; $i++) {
            Product::query()->create([
                'name' => $faker->name,
//                'price' => $faker->price,
//                'amount'=>$faker->amount,
//                'cat_id'=>$faker->cat_id
            ]);
        }
    }
}
