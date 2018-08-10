# GEREKSİNİM ANALİZİ

#### Giriş
> Projemizin amacı, ortak çalışma alanı konseptiyle çalışan “…” isimli işletmenin günlük akışını ve üye işleyişini kontrol altında tutmak ve bir düzene oturtmak için bir web yazılımının hazırlanmasıdır. Planlanan yazılım, işletmeye yeni üye kazandırmak, üyelik işlemlerini hızlandırmak ve var olan üyelerin kontrolünü sağlamak olarak üç temel başlık üzerine konumlanmıştır. İşleyişin sağlanması için sistemin temel kontrolleri en yüksek rütbeli bir yöneticiye ait olacaktır. Sisteme dahil olacak yeni üyelerin kontrolü ve onayında söz sahibi olacak paydaşlar için sadece üye kontrolünde yetkisi olan paydaş türünde bir kullanıcı türü olacaktır.

#### Hedef
-	Sisteme dahil olmak isteyen yeni kullanıcıların başvuru yapabileceği ve bilgi alabileceği bir tanıtım sayfası.
-	Sisteme yeni kayıt olan, var olan, başvuran ancak reddedilen kullanıcıların görülebileceği sadece yönetici rütbesindeki kişilerin görebileceği yönetim sayfası.
-	Sisteme dahil olmak isteyen yeni kullanıcıların onaylanmasında söz sahibi olan paydaşların yeni kayıt olan ve henüz üyelikleri onaylanmayan kullanıcıları görüntüleyebileceği ve onay/ret işlemlerini yapabileceği bir alt yönetici sayfası.

## Roller

#### Admin:
Admin sistem üyelik başvurularını onayına karar veren ilk paydaştır.
Admin paydaş davet edebilir.
Admin referans verebilir.
Admin üyelik dondurma hakkına sahiptir.

#### Üye adayları:
Herkes üyelik başvurusunda bulunabilir. 
Üye adayı gerekli bilgileri girerek üyelik başvurusunda bulunur.
Başvurusu kabul edilen kişi Locomotive CO:LAB sisteminin üyesidir.

#### Üye:
Üyeler internet sitesine giriş yapma hakkına sahip olur.
Üyeler internet sitesi üzerinden başka üye adaylarına referans olabilir.
Üyeler ortak çalışma alanına giriş ve çalışma hakkına sahip olur.

#### Paydaşlar:
Paydaşlar, üye başvurularını değerlendirmek üzere admin tarafından seçilir.
Görüşlerine açılan başvuruları, kabul ve ret olarak değerlendirir.

## Uygulamanın Bölümleri
#### Kullanıcı Ara Yüzü:
Sistem üzerinde farklı bölümler bulunmaktadır. Bu bölümler kontrol ve düzenleme işlemleri için kullanılır.
-	Sistem ana sayfası: Sistemin tanıtımının bulunduğu karşılama sayfasıdır. Sayfa üzerine konumlandırılmış butonlar ile yeni kayıt alınabilir veya sisteme giriş yapılabilir
-	Sistem kayıt sayfası: Sisteme dahil olmak isteyen kullanıcıların bilgilerinin alındığı sayfadır. 
-	Sistem giriş sayfası: Kayıtlı kullanıcı ve paydaşların girişinin yapıldığı ekrandır. Yönetim paneline ulaşabilmek için kontrol ara yüzü olarak kullanılır.

#### Üyeler:
-	Sistem normal üye sayfası: Normal üye statüsüne sahip kullanıcılar giriş yaptıktan sonra kendi ekranlarında giriş kartına ulaşabilmekte ve yeni davet kodu yaratma işlemlerine ait bağlantılar görmektedir.
-	Sistem normal üye kart oluşturma sayfası: Normal üye statüsüne sahip kullanıcının ortak çalışma alanına girebilmesi için gerekli giriş kartının oluşturulduğu sayfadır. Sayfa giriş kartını QR kod olarak vermektedir.

#### Yönetici:
-	Sistem yönetici sayfası: Yönetici statüsüne sahip kullanıcıların giriş yaptıktan sonra kendi ekranlarında temel istatistik bilgileri ve yapabileceği işlemlerin olduğu alanı görebilecektir.
-	Sistem yönetici yeni paydaş sayfası: Yönetici tarafından yeni bir paydaş ekleme yapılacağında kullanılacak sayfadır.
-	Sistem yönetici paydaşlar görüntüleme sayfası: Sistemde bulunan paydaşların listesinin bulunduğu ve bu paydaşların detaylarının (silme ve düzenleme) görülebileceği bağlantıların olduğu sayfadır.
-	Sistem yönetici paydaş görüntüleme sayfası: Seçilen herhangi bir paydaşın detaylarının ve onay işlemlerinin görüntülendiği ekrandır.
-	Sistem yönetici kullanıcılar görüntüleme sayfası: Sistemde bulunan normal statüdeki kullanıcıların listesinin bulunduğu ve bu kullanıcıların detaylarının görülebileceği bağlantıların olduğu sayfadır.
-	Sistem yönetici kullanıcı görüntüleme sayfası: Seçilen herhangi bir normal statüdeki kullanıcının detaylarının (silme ve düzenleme) ve onay veren paydaşların görüntülendiği ekrandır.
-	Sistem yönetici aktivite kontrol sayfası: Kart kullanarak sisteme giriş/çıkış yapan kullanıcıların giriş/çıkış saat bilgileriyle görebildiği ekrandır.
-	Sistem yönetici kullanıcı onaylama sayfası: Sisteme kayıt olan kullanıcıların onaylanması için kullanılan ekran.

#### Paydaş:
-	Sistem paydaş sayfası: Paydaş kullanıcıların giriş yaptıktan sonra onay bekleyen kullanıcıları görebildiği sayfadır. Bu sayfa üzerinden kullanıcıları onaylayabilir veya reddedebilir. 

Ayrıca yukarıdaki her bir sistem sayfası mobil tarayıcılar ile uyumlu olarak çalışabilir.

## Kullanılacak Üçüncü Parti Yazılımlar
-	Uygulama bir yayın aracı olan heroku üzerinde çalışacaktır.
-	Sistem üzerindeki mail işlemleri mail gönderme servisi olan SendGrid üzerinden yapılacaktır.

## Kullanılacak Teknolojiler
- Uygulama Ruby alt yapısı kullanan Rails Web Framework’ü ile programlanacaktır. 
- Arayüz iskeleti Bootstrap Framework’ü ile hazırlanacaktır.
- Uygulama’nın ilgili yerlerinde JQuery Javascript kütüphanesi kullanılacaktır.

## Prototipler
#### Uygulama Landing Page
![locomotive](https://i.imgur.com/jKtCSuq.jpg)
#### Uygulama Yeni Üyelik Formu
![locomotive](https://i.imgur.com/Ui5l9OB.jpg)
#### Uygulama Üye Giriş Formu
![image](https://i.imgur.com/tYVCaEK.jpg)
#### Uygulama Yönetim Paneli
![image](https://i.imgur.com/rUPQO2X.jpg)
#### Uygulama Landing Page [ Mobile ]
![image](https://i.imgur.com/GqSPL84.jpg)
#### Uygulama Yeni Üyelik Formu [ Mobile ]
![image](https://i.imgur.com/glaSZtw.jpg)
#### Uygulama Üye Giriş Formu [ Mobile ]
![image](https://i.imgur.com/le6fotz.jpg)

## Credits
todo
