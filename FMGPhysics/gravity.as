﻿package FMGPhysics{  import flash.utils.Timer;  import flash.events.TimerEvent;  import flash.geom.Point;  public class PhysicalPoint extends Point{    public var vx:Number, vy:Number;    private var ax:Number, ay:Number;    public var b:Number;    public var sakkiTime:Number;    public var timer:Timer;        function PhysicalPoint(xx: Number=0, yy: Number=0){      x = xx;      y = yy;      b = 0.9;      vx = 0;      vy = 0;      ax = 0;      ay = 0;      sakkiTime = new Date().getTime();            timer = new Timer(33);      timer.addEventListener(TimerEvent.TIMER, loop);      timer.start();    }    function loop(event:TimerEvent):void{      var nowTime:Number = new Date().getTime();      var t:Number = (nowTime - sakkiTime)/1000;            x += vx*t + 0.5*ax*t*t;      y += vy*t + 0.5*ay*t*t;            vx += ax*t;      vy += ay*t;            vx *= b;      vy *= b;            ax = 0;      ay = 0;            sakkiTime = nowTime;    }        public function setKasokudo(aax:Number=0, aay:Number=0):void{      ax += aax;      ay += aay;    }        public function setKasokudoByPolar(r:Number=0, dire:Number=0):void{      ax += r*Math.cos(dire);      ay += r*Math.sin(dire);    }	public function gravity(m:Number = 0):void{		var fg = 9.8;		ay += 1/2*fg*m		}	  }}