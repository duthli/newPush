//
//  ViewController.swift
//  math
//
//  Created by do duy hung on 12/08/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class math: UIViewController {
    
    @IBOutlet weak var lbl_Num1: UILabel!
    @IBOutlet weak var lbl_Num2: UILabel!
    @IBOutlet weak var lbl_result: UILabel!
    @IBOutlet weak var Btn_1: UIButton!
    
    @IBOutlet weak var Btn_2: UIButton!
    
    @IBOutlet weak var Btn_3: UIButton!
    
    @IBOutlet weak var Timer: UILabel!
    @IBOutlet weak var count: UILabel!
    
    @IBOutlet weak var Right: UILabel!
    
    var z:Int = 0
    var demWrong: Int = -1
    var demRight: Int = 0
    var tong : Int = 0
    var Thoigian = NSTimer()
    var counter = 10
    
    @IBAction func Btn1_action(sender: UIButton) {
        Kqua()
        print(sender.titleLabel!.text)
        z = Int(sender.titleLabel!.text!)!
        Check()
        reset()
    }
    
    
    
    var buttonsArray: [UIButton]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Random()
        Kqua()
        timmer()
    }
    
    func timmer() {
        Thoigian = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    
    func Random()
    {
        let so1 = random() % 99
        let so2 :Int = random() % 99
        lbl_Num1.text = String(so1)
        lbl_Num2.text = String(so2)
        tong = sum(so1,so2:so2)
    }
    
    
    
    func Kqua()
    {
        var element1  = random() % 99
        let x = tong
        
        if(element1 == x)
        {
            element1 = random() % 99
        }
        
        var element2  = 0
        var arr:[Int] = [x,element1,element2]
        
        //        if (element2 != element1 && element2 != x)
        //        {
        //            arr[2] = element2
        //        }
        //
        //        else{
        //            element2 = random() % 9
        //        }
        while(element1 == element2 || element1 == x || element2 == x){
            element2 = random() & 9
        }
        arr[2] = element2
        
        for idx in 0..<arr.count {
            let nex = Int(arc4random_uniform(UInt32(idx)))
            
            if nex != idx {
                swap(&arr[idx], &arr[nex])
            }
            
        }
        
        let Num1 = arr[0]
        let Num2 = arr[1]
        let Num3 = arr[2]
        
        setbut(Num1,Num2: Num2,Num3:Num3)
    }
    
    
    func setbut(Num1 : Int,Num2 : Int,Num3 :Int)
    {
        UIView.setAnimationsEnabled(false)
        
        Btn_1.setTitle(String(Num1),forState: .Normal)
        
        Btn_2.setTitle(String(Num2),forState: .Normal)
        
        Btn_3.setTitle(String(Num3),forState: .Normal)
    }
    
    func sum (so1:Int,so2:Int)->Int
    {
        return so1+so2;
    }
    
    
    func IsRight(n: Int) ->Int
    {
        let m :Int = tong
        
        if (m == n){
            return 0
        }
        return 1;
    }
    
    func Check()
    {
        if (IsRight(z) == 1 || CheckTime() == 0){
            demWrong+=1;
            count.text =  String(demWrong)
            //lbl_result.text = String(z)
            //reset()
        }
        else if (IsRight(z) == 0 || CheckTime() == 1){
            demRight+=1;
            Right.text = String(demRight)
            //lbl_result.text = String(z)
            //reset()
        }
    }
    
    func reset()
    {
        Random();
        Kqua();
        counter = 10;
        //lbl_result.text = String("?")
    }
    
    
    func CheckTime()->Int
    {
        if (counter <= 0)
        {
            return 0;
        }
        return 1;
    }
    
    
    func timerAction() {
        
        if(counter > 0 ){
            
            counter-=1
            Timer.text = "\(counter)"
        }
        
        if counter <= 0 {
            
            //print("reset timer")
            reset()
            Thoigian.invalidate()
            
            timmer()
        }
    }
    
}
