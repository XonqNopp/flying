#!/usr/bin/env python3
## Script written and maintained by Gael Induni
## Created: Don 2015-07-09 12:20:10 CEST
"""
Version: 0.01
"""

"""
TODO:
"""


from math import sin, asin, pi, degrees, radians

def sind(alpha):
    return sin(radians(alpha))

def asind(val):
    return degrees(asin(val))

def ComputeWind(TC, IAS, WH, WS, inTH = 0, inGS = 0):
    """
    TC: True Course
    IAS: Indicated AirSpeed
    WH: Wind Heading
    WS: Wind Speed

    TH: True Heading
    GS: Ground Speed
    """
    debug = False
    #debug = True
    ##
    sign = 1
    alpha1 = (360 + TC - WH) % 360
    if alpha1 > 180:
        sign = -1
        alpha1 = (360 + WH - TC) % 360
    alpha2 = asind(1.0 * WS / IAS * sind(alpha1))
    alpha3 = 180 - alpha1 - alpha2
    if debug:
        print("sign={:+3d}".format(sign))
        print("alpha1={:3d}".format(alpha1))
        print("alpha2={:3d}".format(int(alpha2)))
        print("alpha3={:3d}".format(int(alpha3)))
    TH = int(round(TC + sign * alpha2) % 360)
    #MH = TH - variation
    if WH == TC:
        GS = IAS + WS
        if debug: print("WIND+++")
    elif alpha1 == 180:
        GS = IAS - WS
        if debug: print("WIND---")
    else:
        GS = int(round(IAS * sind(alpha3) / sind(alpha1)))
    #EET = round(distance * 60.0 / GS)
    if inTH > 0:
        print("TC={:03d} IAS={:3d} WH={:03d} WS={:3d} - TH={:03d} ({:03d}) GS={:3d} ({:3d})".format(TC, IAS, WH, WS, TH, inTH, GS, inGS))
    else:
        print("TC={:03d} IAS={:3d} WH={:03d} WS={:3d} - TH={:03d} GS={:3d}".format(TC, IAS, WH, WS, TH, GS))


def Run():
    ComputeWind( 90, 100,  90, 10, 90, 110)
    ComputeWind( 90, 100, 270, 10, 90,  90)
    ComputeWind( 90, 100, 180, 10, 84,  99)
    ComputeWind( 90, 100, 360, 10, 96,  99)
    ComputeWind(330, 100, 240, 10, 336, 99)
    ComputeWind(330, 100,  60, 10, 324, 99)
    ComputeWind(185, 100, 275, 10, 179, 99)
    ComputeWind(185, 100,  95, 10, 191, 99)
    ComputeWind( 10, 100,  60, 10)
    ComputeWind( 10, 100, 320, 10)

if __name__ == "__main__":
    """
    Do main
    """
    Run()
