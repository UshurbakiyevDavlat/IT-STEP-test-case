<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;
    /**
     * Cart constructor.
     * @param $id
     * @param $price
     * @param $old_prod
     */

    public $countPdoduct = [];
    /**
     * @var mixed
     */
    private $addProducts;
    private $old_prod;

    public function addProduct($product,$old_prod = '')
    {
        $this->addProducts = $this->countPdoduct[$product->id] = $product;
       $this->old_prod = $old_prod;

        if ($this->addProducts) {
            echo "Товар под айди $this->addProducts добавлен в корзину";
        }
    }

    public function __toString() {
        return $this->addProducts." ".$this->old_prod;
    }





}
