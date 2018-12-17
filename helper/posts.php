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

function getPost($id){
    $post=[
        'id'=>1,
        'title'=>'Title1',
        'content'=>'Title1 Title1 Title1',
        'user_id'=>1,
        'user_name'=>'Ayman',
        'comments'=>[
            [
                'id'=>1,
                'content'=>'adasdasd',
                'user_id'=>1,
                'user_name'=>'Ayman',
                'picture'=>'ayman.jpg',
                'created_at'=>'2018-10-10 12:11:12 am'
            ],
            [
                'id'=>2,
                'content'=>'adasdasd',
                'user_id'=>1,
                'user_name'=>'Ayman',
                'picture'=>'ayman.jpg',
                'created_at'=>'2018-10-10 12:11:12 am'
            ]
        ]
    ];
    return $post;
}