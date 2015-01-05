//
//  ViewController.m
//  Evatro Sorular
//
//  Created by Eray on 09/12/14.
//  Copyright (c) 2014 Eray. All rights reserved.
//
//  KAYNAKLAR
//  http://en.wikipedia.org/wiki/Fibonacci_number#Fibonacci_primes
//  http://www.factmonster.com/math/numbers/prime.html

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self firstQuestion];
    [self secondQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)firstQuestion {
    
        NSString *input = @"FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth";
    
    // Kurduğum algoritmanın mantığı simetri üzerine, input string inin ilk karakterinden başlayarak
    // anlık index (i değişkeni) in işaret ettiği karakterin sağındaki ve solundaki karakterleri karşılaştırıyor.
    // Karşılaştırma başarılı ise sağ ve soldaki karakterleri işaret etmek için kullandığım j değişkeni
    // arttıyor, karşılaştırma başarılı değilse i değişkeni bir artıyor ve i 'nin işaret ettiği bir sonraki
    // karakterin sağı ve solundaki karakterler aynı şekilde karşılaştırılıyor. Bu karşılaştırma başarılı olduğu
    // sürece ve eğer boyutu mevcut result stringinin içindeki kelimeden büyük ise result stringine boyutu daha uzun
    // olan yeni simetrik kelime atanıyor.
    
    // Örnek input içinde bulunan en uzun simetrik kelimenin tutulacağı değişken.
    NSString *result = [NSString string];
    
    // Input 'un ilk karakterinden başlayarak sondan bir önceki karaktere kadar giden ilk döngü
    // NOT : i değişkeni simetrik olan kelimenin tam ortasındaki karakteri işaret ediyor.
    for (int i=1; i < [input length] -1; i ++) {
        
        // j değişkeni i 'nin işaret ettiği karakterin sağ ve solundaki karakterleri işaretlemek için.
        int j = 1;
        
        // Aşağıdaki döngü i 'nin işaretlediği karakterin sağına ve soluna doğru azalıp artarken
        // input un sınırlarını kontrol ediyorum eğer sınıra gelinmişse, i 'nin bir arttırılıp arama
        // işlemine devam edilmesini sağlıyorum.
        if ( i -j < 0 || i +j > [input length] -1 ) continue;
        
        // Bu döngü ile i 'nin işaret ettiği karakterin sağ ve solundaki karakterlerlere bakılıyor.
        while ( [input characterAtIndex:i -j] == [input characterAtIndex:i +j] ) {
            
            // Eğer ortada bulunan karakterin sağı ve solundaki karaterler eşit ve söz konusu simetrik kelimenin
            // uzunluğu daha önce bulunan result ın uzunluğundan fazla ise result yeni bulunan simetrik kelime ile
            // güncelleniyor.
            // NOT : 2*j +1 yeni bulunan simetrik kelimenin uzunluğudur.
            if ( [input characterAtIndex:i -j] == [input characterAtIndex:i +j] && 2*j +1 > [result length] ) {
                
                // Objective c 'deki -(NSString *)substringWithRange:(NSRange)aRange fonksiyonunu kullanarak
                // bulduğum simetrik kelimeyi result 'a atıyorum.
                result = [input substringWithRange:NSMakeRange( i -j, 2*j +1 )];
            }
            
            // i 'nin sağına ve soluna doğru genişlemek için.
            j ++;
        }
    }
    
    // Bulunan en uzun simetrik kelimeyi konsola yazdırmak için.
    NSLog(@"Second question's answer          : %@", result);
}

- (void)secondQuestion {
    
    // Step 1
    
    // İkinci sorunun ilk basamağında verilen kendisinden büyük en küçük asal fibonacci sayısı olan 227000 'i minimum
    // değişkenine atadım, ayrıca ikinci sorunun ikinci basamağında sorulan x değişkenini de burada tanımladım.
    int minimum = 227000, x;
    
    // count değişkenini verilen minimum sayısından büyük olan ilk fibonacci sayısının fibonacci dizisindeki
    // kaçıncı sayı olduğunu hesaplamak için tanımladım.
    int count = 0;
    
    // minimum değişkeninde bulunan sayıdan büyük ilk fibonnaci sayısını hesapladım.
    while ( [self fib:count] < minimum ) count ++;
    
    // Sonsuz döngü
    while (YES) {
        
        // Eğer şu anki fibonacci sayısı aynı zamanda asal ise ilk basamağın cevabı bulunmuş olur.
        // Cevap yukarıda tanımlanan x değişkenine atanır, döngüden çıkılır.
        if ( [self isPrime:[self fib:count]] ) {
            
            // Bulunan asal fibonacci sayısını x değişkenine ata.
            x = [self fib:count];
            
            // İlk sorunun ilk basamağının cevabını konsola yazdır.
            NSLog(@"Second question's answer (Step 1) : X is %i", [self fib:count]);
            
            // Döngüden çık.
            break;
        }
        
        // Bir sonraki fibonacci sayısının asal olup olmadığına bakmak için count değişkenini bir arttır döngüye devam et.
        count ++;
    }
    
    // Step 2
    // Sum of prime divisors of X+1
    
    // Yukarıda hesaplanan X 'e bir ekleyip asal bölenlerini divisors arrayine atıyorum.
    NSArray *divisors = [self primeDivisors:x+1];
    
    // İlk sorunun ikinci basamağının cevabının tutulacağı sum değişkenini tanımlayıp değerini 0 'a eşitledim.
    int sum = 0;
    
    // divisors array inin içinde tuttuğum asal bölenlerin toplamını döngü içinde hesaplıyorum.
    for ( NSNumber *divisor in divisors ) {
        
        // arrayin içindeki anlık asal böleni sum değişkenine ekleyip sonucu sum değişkenine atadım.
        sum += [divisor intValue];
    }
    
    // İlk sorunun ikinci basamağının cevabını konsola yazdırmak için.
    NSLog(@"Second question's answer (Step 2) : Sum of prime divisors of X+1 is %i", sum);
}

#pragma mark - Helper Methods

// Parametre olarak girilen integer ın asal olup olmadığını bulan fonksiyon.
// Fonksiyon, eğer parametredeki sayı asal ise "yes" değil ise "no" dönüyor.
- (BOOL)isPrime:(int)number {
    
    // Girilen parametre 0 veya 1 ise olumsuz cevap döner.
    if ( number == 0 || number == 1 ) return NO;
    
    // number a kadar bütün sayıları number 'ı bölüp bölmediğini denemek için i değişkeni tanımladım, 2 atadım.
    int i = 2;
    
    // Döngü ile 2 'den başlayarak number 'ın herhangi bir sayıya bölünüp bölünmediğine bakılıyor.
    while ( i < number && i != 1 ) {
        
        // Eğer number 'ı tam bölen bir sayı bulundu ise NO döner.
        if ( (number % i) == 0 ) return NO;
        
        // Aramaya devam et.
        i++;
    }
    
    // Eğer number 'ı bölen herhangi bir sayı bulunmadı ise YES döner.
    return YES;
}

// Fonksiyon fibonacci dizisinde ki n. sayıyı recursive(kendisini çağırarak) olarak hesaplıyor ve bulduğu sayıyı dönüyor.
- (int)fib:(int)number {
    
    // Eğer number 0 veya 1 ise sayının kendisini dön. Fibonacci serisinde Fib(0) = 0, Fib(1) = 1 olduğu için.
    if (number <= 1) return number;
    
    // Fibonacci serisindeki her hangi bir sayı kendisinden önceki iki sayının toplamına eşittir.
    // Buna göre number 'dan önceki 2 sayı için fib fonksiyonunun kendisini çağırıyoruz.
    return [self fib:(number -1)] + [self fib:(number -2)];
}

// Fonksiyon girilen number parametresinin asal bölenlerini hesaplayıp primeDivisors arrayine atıyor
// ve bu arrayi dönüyor.
- (NSMutableArray *)primeDivisors:(int)number {
    
    // Sonucun atılacağı primeDivisors arrayini tanımladım.
    NSMutableArray *primeDivisors = [[NSMutableArray alloc] init];
    
    // int tipinde count değişkenini tanımladım 2 değerini atadım.
    int count = 2;
    
    // Sonsuz Döngü
    while (YES) {
        
        // number parametresi 1 ise döngüden çık, bütün asal bölenler bulundu.
        if (number == 1) break;
        
        // Eğer number count 'ın anlık değerine bölündüyse count 'ı primeDivisors arrayine ekle.
        // number 'ı bölüm işleminin sonucuna eşitle ve count 'ı 1 arttırarak döngüye devam et.
        if (number % count == 0) {
            
            // count 'ı primeDivisors array 'ine ekle.
            // NOT : @() integer 'ı NSNumber 'a çeviriyor. NSMutableArray NSNumber tipinde değişken tutabiliyor.
            [primeDivisors addObject:@(count)];
            
            // number 'ı bölüm işleminin sonucuna eşitle.
            number = number / count;
        }
        
        // Devam et.
        count ++;
    }
    
    // primeDivisors arrayini döndür.
    return primeDivisors;
}

@end
