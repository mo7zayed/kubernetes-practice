<?php

use App\Jobs\TestKubeJob;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return [
        'Laravel' => app()->version(),
    ];
});

Route::get('/env', function () {
    return [
        'env' => $_ENV,
    ];
});

Route::get('/dispatch', function (Request $request) {
    for ($i = 0; $i < 1000; $i++) {
        dispatch(new TestKubeJob)->onQueue($request->input('queue', 'default'));
    }

    return ['msg' => '1000 jobs dispatched'];
});
