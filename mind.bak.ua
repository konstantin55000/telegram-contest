~version: "2.0"
title: //h1[@class="post__title"]
site_name: "Mind.ua"
$body: //article[has-class("post")]
channel: "@mindua"
subtitle: //h2[@class="post__subtitle"]
$fig: //div[has-class("post__photo")]
$get: //img
@set_attr(src,@data-src): //img
<figcaption>: $fig//div[has-class("post__photo__about")]
<cite>: $fig//div[has-class("post__photo__source")]
 
<figure>: $fig
$phs: $@
cover: $phs[1]

$fig: //div[has-class("img_box2_c")]

<figcaption>: $fig//div[has-class("img_source")]
 
@debug
<figure>: $fig

 @remove: //*[contains(@href,"https://mind.ua/partnership")]
$dt: //span[has-class("post__info__date")]
@datetime(0): $dt  
published_date: $@
$later: //div[@class="post_language"]/a
$aut://span[@class="post__info__author__name"]//a/text()
@combine(", "): //span[@class="post__info__author__name"]//a/text() 
$a2: //span[@class="post__info__author__name"]//a[1]
@debug\

author: $author
#author_url: $aut/a/@href
@debug
@remove: //div[@class="post__section_info"]
@remove: //div[@class="post__info"]
$rls: //div[@class="read-also"]
$adv: //div[@class="post__adv"]
$adv2: //div[@class="post__frame"]
#<blockqoute>: $adv2
<div>: //p[./img]
<div>: //p[./iframe]
<div>: //a[./img]
@remove: $adv
@remove: $rls
$tv: //div[@class="post__tags"]
@remove: $tv
#post__info
body: $body
@append_to($body):$later

#event page
$events: //div[has-class("event")]
@if($events  ) {
  @remove: $events//div[@id="box-content"]
@after_el(./..):   $events/div/img
$img: $@
cover: $img
@debug

@remove: //script

<td>: $events//div[@class="event_info__item"]//div 
@combine(" "): $events//*[@class="event_info__place"]/next-sibling::td
 
@set_attr(colspan, "2"): $events//td[@class="event_info__place__url"]
@debug
<tr>: $events//div[@class="event_info__item"]
<tbody>: $events//div[@class="event_info"]
<table>: $events
@debug
$eve: $@
@prepend_to($body): $eve
}
?path: .*/questions/.*
$qbody: //div[@id="accordion"]
@wrap(<inner>): $qbody
#body: //div[@id="accordion"]
@before_el(./..): //*[@class="ac_answer"]//p
title: //h1[@class="section_title"]

$sums: //h3[@class="ac_question"]
<span>: $sums//a
$answs: //*[@class="ac_answer"]
#@wrap(<details>): $sums
#@combine("<br>"): //h3[@class="ac_question"]/next-sibling::*[@class="ac_answer"]
$desc: //*[@class="qa_description"]

body: $qbody
subtitle: $desc

$details: $@
#body: $details

#<details>
   # <summary>Block title</summary>
  #  ...other things in this block
#</details>
 

#path education
?path: .*/editorial
?path: .*/ads
?path: .*/about
?path: .*/shield
$cont: //div[@class="content__text"]
<p> : $cont//ul
@after(<br>): $cont//p/li
body: //div[@class="content__text"]
title: //h1

