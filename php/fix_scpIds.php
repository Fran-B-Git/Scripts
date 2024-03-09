<?php



function getSpcId(string $dbId): string
{
    $url = sprintf("https://kntk.de/kinode/cinemas/%s/showtimes", $dbId);
    $ch = curl_init($url);

    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $output = json_decode(curl_exec($ch));
    curl_close($ch);
    return $output->id ?? "";
}

$filename = "fixedQuery.json";
$value = json_decode(file_get_contents($filename));
$spcIds = [];
$empty = [];

foreach ($value as $entry) {

    $spc_id = getSpcId($entry->post_id);
    if (empty($spc_id)) {
        $get = [
            "post_id" => $entry->post_id,
        ];

        print_r($get);

        $empty[] = $get;
    } else {
        $get = [
            "post_id" => $entry->post_id,
            "spc_id" => $spc_id
        ];

        print_r($get);
        $spcIds[] = $get;
    }
}

file_put_contents("spcIds.json", json_encode($spcIds));
file_put_contents("empty.json", json_encode($empty));
