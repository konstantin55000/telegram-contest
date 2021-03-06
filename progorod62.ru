~version: "2.1"
?path: /.+
site_name: "портал proГОРОД"

$bnr: //a[img and contains(@href,"clck.ru")]
@before(<br>): $bnr
@remove: $bnr
$bnr: //a[img and contains(@href,"elex.ru")]
@remove: $bnr
 
#@replace("^\\s+$", ""): //text()
title: //h1
@remove: //img[contains(@src, "img15530728559012.jpg")]
#@unsupported: $vk
?path: .*/cityfaces.*
#@set_attr("href",./img): $body//a[img]/@href
$img: //img[contains(@src, "//progorod62.ru/news/15277")]
@replace(src,"https://progorod62.ru/userfiles/picfullsize/img-15277-15544623354898.jpg"): $img
$body: //div[has-class("cityface__items")]
<figcaption>: //*[has-class("cityface__item-author")]
<figure>: //*[has-class("cityface__item")]
@remove: //*[has-class("cityface__item-comments")]
@remove: //*[has-class("cityface__item-votes")]
#@set_attr(src,href): $body//img
 @map($body//*[has-class("photoswipe-link")] ) {
  $curr: $@ 
   @set_attr(src, $curr/@href): $curr//img
 } 
?true:
@unsupported: //div[has-class("playbuzz")]
@unsupported: //div[@data-show-info]

@wrap_inner(<strong>): //div[has-class("article__lead-content")]/p
@wrap_inner(<strong>): //div[has-class("article__lead-content")]

# $rel: //*[has-class("article__insert")][last()]
# <related>: $rel
$as: //img/ancestor::a
#@remove: $as/img
@remove: $as[contains(@href,"elex.ru")]
@remove: $as[contains(@href,"click.ru")]
@debug
@debug
@before(<hr>) : //p[has-class("article__insert")]
@after(<hr>) : //p[has-class("article__insert")]
 $last: //p[has-class("article__insert")][last()]
 @remove: $last/next-sibling::hr
#  @remove: //a[contains(@href, "elex.ru")]/next-sibling::img
#  @remove: //a[contains(@href, "click.ru")]/next-sibling::img
#  @remove: //a[contains(@href, "elex.ru")]/img
#  @remove: //a[contains(@href, "click.ru")]/img
#  @remove: //img[contains(@src, "img15544523169306.jpg")]
#  @remove: //img[contains(@src, "/userfiles/articles/_cke/0/img15544523818614.jpg")]
#@wrap(<caption>): $h2
#@wrap(<thead>): $h2
#@wrap(<aside>): //td//h2
#@before_el("./.."): $h2[1]
$as: //a//img
@debug

#   $s: //blockqoute[has-class("twitter-tweet")]
#   @set_attr(data-href,$s/a/@href): $s
#   @urldecode
#   @set_attr(src, data-href): $s
# @wrap_inner(<iframe>): $s


# @if( $vk ) {
#   @debug: $@/following-sibling::script[contains(text(), "vk_post")]
#   @match("\"vk_post.+?\\'.+?\\'")
#   $params: $@/text()
  
#   @clone: $params
#   $owner_id: $@
#   @replace("^.+?, ", ""): $owner_id
#   @replace(",.+$", ""): $owner_id
  
#   @clone: $params
#   $post_id: $@
#   @replace("^(.+?,){2} ", ""): $post_id
#   @replace(",.+$", ""): $post_id
  
#   @clone: $params
#   $hash: $@
#   @match("'.+'", 0): $hash
#   @replace("'", "")
  
#   @debug: $params
#   @debug: $owner_id
#   @debug: $post_id
#   @debug: $hash
  
#   #https://vk.com/widget_post.php?owner_id=-100283479&post_id=122689&hash=79LyRk2mgobJgT0WwbkcdYP98Q
#   @append(<iframe>, src, "vk_post"): $vk
#   $iframe: $@
#   @set_attr(src, "https://vk.com/widget_post.php?owner_id=", $owner_id, "%26post_id=", $post_id, "%26hash=", $hash): $iframe
#   @urldecode: $iframe/@src
#   @debug: $iframe/..
  
#   @replace("(\\s|\u00a0)", ""): $vk/text()
# }

$t: //blockquote
@debug
$f: //blockquote[./blockquote]
@debug
$dsa: //*[has-class("instagram-media")]//p[@style="text-align: center;"]/img
@remove: $dsa/..
$d: //blockquote//blockquote
@debug
<p> : $f
@after_el("./.."): $d
#<aside> : $d *[has-class("instagram-media")]
$mm://p/next-sibling::*[has-class("instagram-media")]
 

#tournament


 

 


 
 





<pic>: //img[ancestor::td]

@set_attr("href",./img): //a[./img]/@href

@after_el("./.."): //p/iframe
@after_el("./.."): //a/img

@after_el("./.."): //p/related

 $cvr: //div[has-class("article__main-photo")]
 @background_to_image: //div[has-class("article__main-photo-img")]
 $img: $@
 @debug
 #@prepend($img):$cvr
 @append_to($cvr): $img
  @wrap_inner(<figure>): $cvr
   @debug
    @wrap_inner(<cite>): $cvr//span[HAS-CLASS("article__main-photo-copy")]
  <figcaption> :  $cvr//span[HAS-CLASS("article__main-photo-copy")]


  cover: $cvr//figure
# cover: $cvr//img
 <aside>: //*[@style="text-align: center;"]

 $vk: //*[contains(@id, "vk_post")]  
@if( $vk ) {
  @debug: $@/following-sibling::script[contains(text(), "vk_post")]
  @match("\"vk_post.+?\\'.+?\\'")
  $params: $@/text()
  
  @clone: $params
  $owner_id: $@
  @replace("^.+?, ", ""): $owner_id
  @replace(",.+$", ""): $owner_id
  
  @clone: $params
  $post_id: $@
  @replace("^(.+?,){2} ", ""): $post_id
  @replace(",.+$", ""): $post_id
  
  @clone: $params
  $hash: $@
  @match("'.+'", 0): $hash
  @replace("'", "")
  
  @debug: $params
  @debug: $owner_id
  @debug: $post_id
  @debug: $hash
  
  #https://vk.com/widget_post.php?owner_id=-100283479&post_id=122689&hash=79LyRk2mgobJgT0WwbkcdYP98Q
  @append(<iframe>, src, "vk_post"): $vk
  $iframe: $@
  @set_attr(src, "https://vk.com/widget_post.php?owner_id=", $owner_id, "%26post_id=", $post_id, "%26hash=", $hash): $iframe
  @urldecode: $iframe/@src
  @debug: $iframe/..
  
  @replace("(\\s|\u00a0)", ""): $vk/text()
}
@debug
$setsrc: $body//img[@srcset]
@set_attr(src_set, @srcset):
@replace("http.+w, ", ""): $setsrc/@src_set
@replace("(jpe?g|png|gif).+w", "$1"): $setsrc/@src_set
@set_attr(src, @src_set): $setsrc
#@remove: //h2[a]
# @remove: //h2[strong//a]
@if("//object[contains(@data, \"youtube\")]") {
  @before(<iframe>): //object[contains(@data, \"youtube\")]
  @replace("http://www.youtube.com/v/","https://www.youtube.com/embed/"): //object[contains(@data, "youtube")]/@data
  @set_attr(src, "./next-sibling::object[contains(@data, \"youtube\")]/@data"): //iframe[next-sibling::object[contains(@data, "youtube")]]
  @remove: //object[contains(@data, "youtube")]
}


@after(<br>): $body//blockquote//p


title: //h1
?exists: //div[has-class("article__main")]
$body: //div[has-class("article__main")]
 

@set_attr(href, "./ancestor::a/@href"): $body//a/img[@href and not(ends-with(@href, ".jpg")) and not(ends-with(@href, ".png")) and not(ends-with(@href, ".gif")) and not(ends-with(@href, "jpeg"))]
 
 

#$links: $pgal//a
#$h2: //table/h2
#@before_el("../.."): $h2
@set_attr(src, "./ancestor::a/@href"): //a[not(ends-with(@href, "jpg")) and not(ends-with(@href, "JPG")) and not(ends-with(@href, "jpeg")) and not(ends-with(@href, "JPEG")) and not(ends-with(@href, "gif")) and not(ends-with(@href, "GIF")) and not(ends-with(@href, "png")) and not(ends-with(@href, "PNG"))]//img
 
 




 @debug
#@append_to(//slideshow): $pgal//figure
#@append_to($body): $pgal
title: //meta[@property="og:title"]/@content
description: //meta[@name="description"]/@content
#cover: $body//figure
cover: $body//img
image_url: //meta[@property="og:image"]/@content
image_url: $body//img/@src
site_name: //meta[@property="site_name"]/@content
$dt: //*[has-class("article__date")]
@datetime(0, "ru_RU","d M yyyy"):  $dt
published_date: $dt

author://a[has-class("article__author")]
author_url://a[has-class("article__author")]/@href

@style_to_attrs(height, height, width, width): //img
<pic> : //img[@width and @width <370 and @height and @height < 370] 
$pics: $@
@debug
 @set_attrs(width,"150", height, "150"): $pics
#<pic> : //img[@height and @height < 250] 
 @prepend_to($body): //div[has-class("article__lead-content")]

$ft: //*[has-class("article__censor")]

@replace(":", "."): //a[@href="https://clck.ru/FMfbN"]
$relto: //div[has-class("article__footer-content") and has-class("link-container")]
@append_to($body) : $relto
<related> : $relto
 
@debug
@remove: //hr/next-sibling::hr
@append_to($body): $ft
<footer>: $ft
$problems: $body
@while( $problems ) {
  $test: $body//*[self::blockquote or self::aside or self::figure or (self::img and not(./ancestor::figure)) or self::iframe or self::slideshow or self::related or self::footer or self::table[not(ancestor::table) and not(descendant::table)]]
 
  $problems: $test/self::*[ancestor::anchor or ancestor::blockquote or ancestor::aside or ancestor::footer or ancestor::strong or ancestor::b or ancestor::em or ancestor::i or ancestor::ins or ancestor::u or ancestor::del or ancestor::s or ancestor::strike or ancestor::code or ancestor::kbd or ancestor::samp or ancestor::tt or ancestor::mark or ancestor::sup or ancestor::pic or ancestor::sub or ancestor::a or ancestor::reference or ancestor::h1 or ancestor::h2 or ancestor::h3 or ancestor::h4 or ancestor::h5 or ancestor::h6 or ancestor::p or ancestor::pre or ancestor::hr or ancestor::img or ancestor::br]
 
  @split_parent: $problems
}
