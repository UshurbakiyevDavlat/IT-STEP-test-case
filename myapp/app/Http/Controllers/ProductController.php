<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    //
    public function index()
    {
        return Product::all();
    }

    public function show(Product $product): Product
    {
//        return Product::query()->find($id);
        return $product;
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
