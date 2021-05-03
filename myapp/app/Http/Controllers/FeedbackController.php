<?php

namespace App\Http\Controllers;

use App\Mail\FeedbackMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class FeedbackController extends Controller
{
    //
    public function send($comm) {
        $comment = $comm;//'Это сообщение отправлено из формы обратной связи';
        $toEmail = "test@mail.test";
        Mail::to($toEmail)->send(new FeedbackMail($comment));
        return 'Сообщение отправлено на адрес '. $toEmail;
    }
}
