<?php

namespace App\Http\Controllers;


session_start();

use App\Mail\FeedbackMail;
use App\Models\Cart;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use phpDocumentor\Reflection\Types\String_;

class ProductController extends Controller
{
    //
    public function index()
    {

        return Product::all();
    }

    public  function  add (Product  $product)
    {
        $uid = $_SESSION['u_id'];
        if (isset($uid)) {
//

            $old_cartArr= User::query()->select("cart")->where('users.id','=',"$uid")->get();
            $old_cart = [];
            foreach ($old_cartArr as $item) {
                $old_cart = ($item['cart']);
            }


        $cart = new Cart();

        $cart->addProduct($product,$old_cart);

            User::query()->where('users.id','=',"$uid")->update([
                'cart' => $cart->__toString()." "
            ]);

            $mailBody = new FeedbackMail("Successfully made an order!");
            $mailBody->build();

            $mail = new FeedbackController();
            $mail->send($mailBody);

        }

}


    public function show(Product $product): Product
    {
//        return Product::query()->find($id);
        return $product;
    }
    public function showProdByCat($cat_id)
    {
//     where("cat_id",'=',"$cat_id");
        return Product::query()->where("cat_id",'=',"$cat_id")->get();
//            return $product
    }

    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
//        return Product::query()->create($request->all());
        $product = Product::query()->create($request->all());

        return response()->json($product, 201);
    }

    public function update(Request $request, Product $product): \Illuminate\Http\JsonResponse
    {
//        $product = Product::query()->findOrFail($id);
        $product->update($request->all());

//        return $product;
        return response()->json($product, 200);
    }

    public function delete(Product $product): \Illuminate\Http\JsonResponse
    {
//        $article = Product::query()->findOrFail($id);
//        $article->delete();
//
//        return 204;
        $product->delete();

        return response()->json(null, 204);
    }
}
