#old 2 aut
!figcaption is missing https://mind.ua/news/20194120-travmovanij-cherez-krosivok-nike-basketbolist-mozhe-otrimati-8-mln-strahovki
#related! : https://mind.ua/publications/20184607-eliksir-zhittya-yak-farmacevtichna-firma-darnicya-stvoryuvala-virobnictvo-infuzij
#!nested element to support
https://mind.ua/publications/20193089-nichogo-osobistogo-5-ted-vistupiv-pro-sheringovu-ekonomiku

#https://mind.ua/publications/20184607-eliksir-zhittya-yak-farmacevtichna-firma-darnicya-stvoryuvala-virobnictvo-infuzij
#mind.ua http://prntscr.com/mnqwci
#related links dynamicly changing
#https://mind.ua/ru/publications/20177078-chelovek-nedeli-hyu-hefner-tot-kto-sdelal-mir-svobodnym
№https://prnt.sc/mnqy7r
Channel Must to be set Min.ua not mind.live channel
2 authors is missing

https://mind.ua/ru/publications/20172756-gonka-na-vyzhivanie-rejting-strahovyh-kompanij-2017

#static pages https://mind.ua/editorial
#https://mind.ua/ads

#diff figcaptions
#https://mind.ua/publications/20193607-mi-z-it-kudi-piti-vchitisya-na-programista-u-2019-roci
#reclama link
#https://mind.ua/publications/20191791-navishcho-ukrayinskij-kompaniyi-vidkrivati-vlasnu-it-shkolu-ta-bezkoshtovno-navchati-lyudej

#2 authors:
#https://mind.ua/publications/20184607-eliksir-zhittya-yak-farmacevtichna-firma-darnicya-stvoryuvala-virobnictvo-infuzij

#iframe src https://mind.ua/education/934-vnutrishni-komunikaciyi-dlya-vlasnikiv-strategichnij-riven
#events page
#https://mind.ua/education/934-vnutrishni-komunikaciyi-dlya-vlasnikiv-strategichnij-riven
#
#https://mind.ua/shield after reideriv
#https://mind.ua/openmind/20193742-8-mlrd-neefektivnosti-abo-chomu-ukrayinci-platyat-za-perevitrati-u-svinarstvi
#optional read more

https://mind.ua/ru/publications/20172756-gonka-na-vyzhivanie-rejting-strahovyh-kompanij-2017
check for generateion
2 authors https://mind.ua/ru/publications/20173816-strahovoj-sluchaj-pochemu-kompanii-yuriya-yavtushenko-lishili-licenzij


 
 #related articles
 https://mind.ua/openmind/20193742-8-mlrd-neefektivnosti-abo-chomu-ukrayinci-platyat-za-perevitrati-u-svinarstvi



https://mind.ua/publications/20193961-grupovij-portret-v-intereri-7-zapitan-do-privatbanku
читайте-також плохо выделянемый
может структуру https://mind.ua/ru/publications/20193715-kak-izbavitsya-ot-mirovoj-problemy-s-plastikom-dilemma-krupnogo-biznesa
http://prntscr.com/mp886s
~version: "2.0"
title: //h1[@class="post__title"]
site_name: "Mind.ua"
$body: //article[has-class("post")]
channel: "@mindua"
subtitle: //h2[@class="post__subtitle"]
$fig: //div[has-class("post__photo")]

<figcaption>: $fig//div[has-class("post__photo__about")]
<cite>: $fig//div[has-class("post__photo__source")]
@debug
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
$aut: //span[@class="post__info__author__name"]//a
@combine(", "): //span[@class="post__info__author__name"]//a
@debug
#author_url: $aut/a/@href
author: $aut
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