<?php

function post(Request $request, array $args): Responder
{

    \file_put_contents('l.json', \json_encode($document));
    return new JsonResponder(['a' => 'b']);


}
