;
;=================================================================================================
;| Birnur Uzun																					
;| BSM 5510 Bulanık Mantık ve Mühendislik Uygulamaları Dersi																
;| Nisan 30, 2019																				
;|																								
;| Bu program, kural tabanlı uzman sistem dili olan Clips kullanılarak geliştirilmiştir.		
;| Amaç: Kedilerin beden dillerini anlamlandırabilmek için, kedilere ait olan davranış			
;| bilgisini temsil eden ve üzerinde çıkarsama yapan bir uzman sistem programı gerçekleştirmek.	
;=================================================================================================
;
;	                         ..,co88oc.oo8888cc,..
;  o8o.               ..,o8889689ooo888o"88888888oooc..
;.88888             .o888896888".88888888o'?888888888889ooo....
;a888P          ..c6888969""..,"o888888888o.?8888888888"".ooo8888oo.
;088P        ..atc88889"".,oo8o.86888888888o 88988889",o888888888888.
;888t  ...coo688889"'.ooo88o88b.'86988988889 8688888'o8888896989^888o
; 888888888888"..ooo888968888888  "9o688888' "888988 8888868888'o88888
;  ""G8889""'ooo888888888888889 .d8o9889""'   "8688o."88888988"o888888o .
;           o8888'""""""""""'   o8688"          88868. 888888.68988888"o8o.
;           88888o.              "8888ooo.        '8888. 88888.8898888o"888o.
;           "888888'               "888888'          '""8o"8888.8869888oo8888oooo .
;      . :.:::::::::::.: .     . :.::::::::.: .   . : ::.:."8888 "888888888888oo.
;                                           _              :..8888,. "888888888.
;								          | |     		 .:o888.o8o.  "866o9888.
;								  ___ __ _| |_ ___ 		 :888.o8888.  "88."89".
;								 / __/ _` | __/ __|		. 89  888888    "88":
;								| (_| (_| | |_\__ \    	:.     '8888o
;								 \___\__,_|\__|___/     .       "8888..                                                         
;                                                                   888888o.
;                                                                    "888889,
;                                                             . : :.:::::::.: :.
;  ______________________________________________________________________________________________	   	
;

(defglobal ?*input* = "")

(defrule state_input
	(initial-fact)
	=>
	(printout t "Kedinizin beden diliyle size bir şeyler anlatmaya çalıştığını düşünüyor ve onu anlamaya 
çalışıyorsanız doğru yerdesiniz." crlf
	"Kedinizin hareketlerini anlamlandırabilmem için öncelikle, tanımlamak istediğiniz genel hareket tipini 
seçiniz..." crlf crlf 
	
	"(1) kuruk hareketleri" crlf
	"(2) kulak ve göz hareketleri" crlf
	"(3) diğer..." crlf crlf)

	(bind ?*input* (read))

	(switch ?*input*
		(case 1 then (assert(state 1)))
		(case 2 then (assert(state 2)))
		(case 3 then (assert(state 3)))))

;*******************************************************************************************************
; kuyruk hareketlerini tanımladığımız kısım
;*******************************************************************************************************

(defrule state1
	?current <- (state 1)
	=>
	(retract ?current)
	(printout t crlf "Kedinizin kuyruğu yukarıda mı yoksa aşağıda mı? (yukarıda/aşağıda)" crlf crlf)
	
	(bind ?*input* (read))	

	(if (eq ?*input* yukarıda)
		then 
		(assert (keep-up))		
		else
		(assert (keep-down))))


(defrule keep_up 
	?current <- (keep-up)
	(test (eq ?*input* yukarıda))
	=>
	(printout t crlf "Öyleyse şimdi de kedinizin kuyruk hareketlerine uygun olan numarayı girin:" crlf crlf
	"(1) kabarık" crlf
	"(2) dimdik" crlf
	"(3) dik ve ucu aşağa doğru bükülmüş" crlf
	"(4) titreşim hareketi şeklinde sallıyor" crlf crlf)

	(bind ?*input* (read))
	
	(switch ?*input*
		(case 1 then (assert(fluffy)))
		(case 2 then (assert(uprightly)))
		(case 3 then (assert(deflexed)))
		(case 4 then (assert(vibration)))))	

; kuyruk tüyleri kabarıksa
(defrule fluffy1
	?current <- (fluffy)
	(test (eq ?*input* 1))
	=>
	(retract ?current)
	(printout t crlf "Kedinizin bir şeye kafası atmış, oldukça sinirli. Tüylerini kabartıp dişlerini 
gösterebilir. Sakın el uzatmayın, bırakın kendi kendine sakinleşsin." crlf crlf))

; kuruğu dimdik ise
(defrule uprightly1
	?current <- (uprightly)
	(test (eq ?*input* 2))
	=>
	(retract ?current)
	(printout t crlf "Kediniz sizi gördüğüne çok sevinmiş <3 " crlf crlf))

; kuyruğu dik ve ucu aşağı doğru bükülmüş ise
(defrule deflexed1
	?current <- (deflexed)
	(test (eq ?*input* 3))
	=>
	(retract ?current)
	(printout t crlf "Kediniz arkadaş olmaya açık, sizinle uzlaşmaya karar vermiş :D " crlf crlf))

; kuyruğunu titreşim hareketi şeklinde sallıyor ise
(defrule vibration1
	?current <- (vibration)
	(test (eq ?*input* 4))
	=>
	(retract ?current)
	(printout t crlf "Kediniz çiftleşme döneminde olabilir. Büyük ihtimalle karşısındakine kendini 
beğendirmeye çalışıyor." crlf
"Ona sevimli bir arkadaş bulun ^^ " crlf crlf ))

;*****************************************************************

(defrule keep_down
	?current <- (keep-down)
	(test (eq ?*input* "aşağıda"))
	=>
	(retract ?current)

	(printout t crlf "Öyleyse şimdi de kedinizin kuyruk hareketlerine uygun olan numarayı girin:" crlf crlf
	"(1) kabarık" crlf
	"(2) bacaklarının arsında" crlf
	"(3) sallıyor" crlf crlf)


	(bind ?*input* (read))
	
	(switch ?*input*
		(case 1 then (assert(fluffy2)))
		(case 2 then (assert(between_its_legs)))
		(case 3 then (assert(shakes)))))	
	
; kuyruk tüyleri kabarıksa
(defrule fluffy2
	?current <- (fluffy2)
	(test (eq ?*input* 1))
	=>
	(retract ?current)
	(printout t crlf "Kediniz korkmuş veya tedirgin. Kucağınıza alıp sakinleştirin." crlf crlf))

; kuyruğunu bacaklarının arasına almış veya bu şekilde oturuyorsa
(defrule between_its_legs2
	?current <- (between_its_legs)
	(test (eq ?*input* 2))
	=>
	(retract ?current)
	(printout t crlf "Kediniz özgüvensiz ve hareketsiz bir biçimde oturup etrafı izliyordur. 
Genellikle kedilerin yeni biri ile karşılaştığında yaptığı, klasik kedi hareketidir. 
Endişelenicek bişiy yok. Kendi haline bırakın." crlf crlf))

;kuyruğunu sallıyorsa
(defrule shakes2
	?current <- (shakes)
	(test (eq ?*input* 3))
	=>
	(retract ?current)
	(printout t crlf "Bu durum kedinizin, onu ne kadar çok sevdiğinizi anladığını gösterir. Onu sevin:D " 
crlf crlf))

;****************************************************************
; kulak ve göz hareketlerini tanımladığımız kısım
;****************************************************************

(defrule state2
	?current <- (state 2)
	=>
	(retract ?current)
	(printout t crlf "Kediniz kulaklarını geriye doğru yatırıp gözlerini kocaman açıyor mu? (evet/hayır)"  
crlf crlf)

	(bind ?*input* (read))
	
	(if (eq ?*input* evet)
		then
		(printout t crlf "Korktuğunun veya her an saldırıya hazır olduğunun göstergesidir bu. Hatta bazen 
konuşuyormuş gibi sesler çıkartabilirler." crlf crlf)		
		else
		(printout t crlf "Kediniz kulaklarını dikleştirip etrafı mı seyrediyor? (evet/hayır)" crlf crlf)
		(bind ?*input* (read))

		(if (eq ?*input* evet)
			then
			(printout t crlf "Kediniz çevredeki sesleri dinleyerek ne olup bittiğini anlamaya çalışıyor." 
Oldukça meraklı :D crlf crlf)
			else
			(printout t crlf "Kendi halinde takılıyor. Çok da üstüne gitmeyin :D " crlf crlf))))


;****************************************************************
; diğer bir takım hareketlerini tanımladığımız kısım
;****************************************************************

(defrule state3
	?current <- (state 3)		
	=>
	(retract ?current)	
	(assert (question 1)))

(defrule question1
	?current <- (question 1)
	=>
	(retract ?current)
	(printout t crlf "Kediniz yere yatıp karnını açarak yuvarlanıyor mu? (evet/hayır)" crlf crlf)
	(bind ?*input* (read))

	(if (eq ?*input* evet)
		then 
		(printout t crlf "Bu durum, onun kendini sevdirmek istediğini ve güveninin size tam olduğunu 
gösterir. Kediler genellikle sizinle oynamak istediğinde veya yerinde çok rahat olduğunu belirtmek 
istediğinde böyle davranır." crlf)
		(printout t "Onu sevin ve onunla oynayın <3 " crlf crlf)		
		else 
		(assert (question 2))))

(defrule question2
	?current <- (question 2)
	=>
	(retract ?current)
	(printout t crlf "Kediniz karnını yere dayayıp komando gibi yerde sürünüyor mu? (evet/hayır)" crlf crlf)
	(bind ?*input* (read))

	(if (eq ?*input* evet)
		then
		(printout t crlf "Kediniz dışarıdan gelebilecek herhangi bir tehlike için kendini koruma altına 
almaya çalışıyor olabilir." crlf crlf)
		else 
		(assert (question 3))))

(defrule question3
	?current <- (question 3)
	=>
	(retract ?current)
	(printout t crlf "Kediniz tırnaklarını yumuşak zeminlere geçiriyor mu? (evet/hayır)" crlf crlf)
	(bind ?*input* (read))

	(if (eq ?*input* evet)
		then
		(printout t crlf "Kediniz yavru mu yetişkin mi? (yavru/yetişkin)" crlf crlf)
		(bind ?*input* (read))

		(if (eq ?*input* yavru)
			then
			(printout t crlf "Kedinizin bu hareketi yapmasının sebebi tırnaklarının henüz oluşum aşamasında 
olması ve bu sebeple tırnaklarını kaşımaya çalışıyor olmasıdır." crlf crlf)
			else
			(printout t crlf "Kediniz rahat bir yer bulduğunu ve uyumak üzere olduğunu anlatmaya çalışıyor."
crlf crlf))
		else
		(assert (question 4))))

(defrule question4
	?current <- (question 4)
	=>
	(retract ?current)
	(printout t crlf "Kedinizi severken veya onunla oyun oynarken sizi ısırıyor mu?(evet/hayır)" crlf crlf)
	(bind ?*input* (read))

	(if (eq ?*input* evet)
		then 
		(printout t crlf "Sakin olun, bu durumun saldırganlıkla bir alakası yok. Ya dişleri kaşınıyordur ya da 
sizinle oynamaktan büyük zevk alıyordur." crlf crlf)
		else
		(assert (question 5))))

(defrule question5 
	?current <- (question 5)
	=>
	(retract ?current)
	(printout t crlf "Kediniz büzüşerek top şeklinde mi yatıyor?(evet/hayır)" crlf crlf)
	(bind ?*input* (read))

	(if (eq ?*input* evet)
		then
		(printout t crlf "Kediniz üşümüş. Vücut ısısını korumaya çalşıyor. Ortamın sıcaklığını arttırın." 
crlf crlf)
		else
		(assert (question 6))))
				
(defrule question6
	?current <- (question 6)
	=>
	(retract ?current)
	(printout t crlf "Kediniz gördüğü tüm kutulara girmeye mi çalışıyor? (evet/hayır)" crlf crlf)
	(bind ?*input* (read))

	(if (eq ?*input* evet)
		then 
		(printout t crlf "Kutu merakından değil, sadece dar olan yerlerde kendini daha güvende hissediyor." 
crlf crlf)
		else
		(assert (question 7))))

(defrule question7
	?current <- (question 7)
	=>
	(retract ?current)
	(printout t crlf "Kediniz sürekli bilgisayarınızın üzerinde mi uyuyor? (evet/hayır)" crlf crlf)
	(bind ?*input* (read))

	(if (eq ?*input* evet)
		then
		(printout t crlf "Kediniz bunu sizi gıcık etmek için yapmıyor. Sadece sıcak yerlerde uyumayı 
çok seviyor ^^ " crlf crlf)
		else
		(printout t crlf "Kendi halinde takılıyor. Çok da üstüne gitmeyin :D " crlf crlf)))

