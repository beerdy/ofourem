
var polls=[];

var requests_index=0;
var requests_max=100;
var offset=0;
var count=100;

var post;
var requests_len=1;

var items_index=0;
var post_type;

while(requests_index<=requests_max)
{
  if(requests_len!=0){
    post=API.wall.get({"owner_id":393858255,"offset":offset,"count":count});
    requests_len=post.items.length;
    
    items_index=0;
    while(items_index<=requests_len){
      post_type=post.items[items_index].attachments[0].type;
      if(post_type=="poll"){
        polls=polls+[post.items[items_index]];
      };
      items_index=items_index+1;
    }
    
    offset=offset+100;
  };
  requests_index=requests_index+1;
}
var alen=arr.length;
return arr;



//-------------------------------------------



var result;
var index;
var type;

var ar=[];




if(type=="poll"){
  result="Это ПУЛЛ";
  ar=ar+[posts.items[1]];
} else {
  result="Нет ПУЛЛА";
};

var index=0;
var item=0;
var offset=0;
var count=100;

var posts=API.wall.get({"owner_id":4684420,"offset":offset,"count":count});
var len=posts.items.length;

while(index=<len)
{

  type=posts.items[item].attachments[0].type;
  item=item+1;
  if()
  posts.items[index].attachments[0].type;
  index=index+1;
}
return posts.items[0];
//======

var%20offset%3D0%3Bvar%20count%3D100%3Bvar%20posts%3DAPI.wall.get(%7B%22owner_id%22%3A4684420%2C%22offset%22%3Aoffset%2C%22count%22%3Acount%7D)%3Bvar%20len%3Dposts.items.length%3Breturn%20len%3B&params[v]=5.68














