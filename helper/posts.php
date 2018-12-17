<?php
function getPosts($cat_id=null,$limit=null,$page=1,$condition=null){
    $posts=[
        [
            'id'=>1
            ,'title'=>'Title1'
            ,'content'=>'Content 1 Content 1 Content 1 Content 1 Content 1 Content 1 '
            ,'created_at'=>'2018-09-11'
            ,'category_id'=>1
            ,'category_name'=>'Sports'
            ,'user_id'=>1
            ,'user_name'=>'Ayman'
        ],
        [
            'id'=>2
            ,'title'=>'Title2'
            ,'content'=>'Content 1 Content 1 Content 1 Content 1 Content 1 Content 1 '
            ,'created_at'=>'2018-09-11'
            ,'category_id'=>1
            ,'category_name'=>'Sports'
            ,'user_id'=>1
            ,'user_name'=>'Ayman'
            ]
    ];
    $totalCount=20;

return $posts;
}