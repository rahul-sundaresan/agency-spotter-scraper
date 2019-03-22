#!/bin/bash

URL_PREFIX="https://www.agencyspotter.com/search.js?budget_mid=999999999.99&industry_ids%5B%5D=2&industry_ids%5B%5D=12&industry_ids%5B%5D=13&industry_ids%5B%5D=19&industry_ids%5B%5D=10&industry_ids%5B%5D=29&industry_ids%5B%5D=31&industry_ids%5B%5D=50&industry_ids%5B%5D=30&industry_ids%5B%5D=49&industry_ids%5B%5D=38&industry_ids%5B%5D=4&industry_ids%5B%5D=6&industry_ids%5B%5D=42&industry_ids%5B%5D=40&industry_ids%5B%5D=43&industry_ids%5B%5D=45&industry_ids%5B%5D=46&industry_ids%5B%5D=37&industry_ids%5B%5D=36&industry_ids%5B%5D=39&industry_ids%5B%5D=48&industry_ids%5B%5D=24&industry_ids%5B%5D=22&industry_ids%5B%5D=32&industry_ids%5B%5D=25&industry_ids%5B%5D=47&industry_ids%5B%5D=21&industry_ids%5B%5D=23&industry_ids%5B%5D=5&industry_ids%5B%5D=20&industry_ids%5B%5D=44&industry_ids%5B%5D=33&industry_ids%5B%5D=28&industry_ids%5B%5D=9&industry_ids%5B%5D=14&industry_ids%5B%5D=35&industry_ids%5B%5D=16&industry_ids%5B%5D=34&industry_ids%5B%5D=27&industry_ids%5B%5D=41&per_page=32&search_seed=202461&page="

DIRECTORY="yeet/"

page_no=1
MAX_PAGE=452

while [ $page_no -le $MAX_PAGE ]
do
    file_name=$(printf "%03d" $page_no)
    echo 'grabbing page '$page_no
    url=$URL_PREFIX$page_no
    echo "grabbing URL: ${url}"
    curl ${url} -H 'authority: www.agencyspotter.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36' -H 'dnt: 1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: __cfduid=d68b867ef0ff36409d1e835d615b93dad1553224773; cookies_accepted=true; XSRF-TOKEN=AYO483zXwsKiQ%2FoummNadnRo6eSh8%2BvNdSqgSL30UxQ%3D; num_searches=2; has_logged_in_before=true; has_logged_in_basic_before=true; _agency-spotter_session=a1gxeTArVGkvaFZGM1ljZmQwQzJHb0xGYU9vYjZJTVFZN2dBY0tuWThxdTFWSHA5V2dFaXZBVzZyT0gwYnpZMk5zbFllRzVsNkd1WFlScncxV0ptNVFEZHcrazdRc2M2NXhwUkZ0WlNLc0tsOFU5a1VDTzUwemFsZElqUy9hSU03OHJsQmNSOE9OMG93bllpZmdHRGxoTjFabmFuVm1JbXk0am56YTJFaDRGRUl6RFBoelVsdnBPR2toeXY2eTNKYkU2SUFTSWk3ZzNjeUxBVlM0dW0vL1k3cGc2b2ZWRnZZcmJFZ05UTkdQc3hRS1haK1ZUbVhTaGlUcDhNNUVFU2p1WVUrbXNPcFFnaWgzdGpBa2hyVHNkV1dzSEJrRkkwV2ZaVEZ6ZWhZZ1JscUh1OXlLM2trOU9uQ25icjB0SThjbm9DNmlvZkVDWUh4QVZ3dlVZOHBJWVFiZURicDFUSHdTS0pHVTduRkNLYzZOTzZVeWU4Z0UzZVVTQ1pCUndoLS1WQnFOUTFwaHpadXhVN01zOUR4TDFnPT0%3D--cdea31c03d2b7863dde2691b26ba41f7ed409775' --compressed -o yeet/page_${file_name}.html
    ((page_no++))
    sleep 3s
done
