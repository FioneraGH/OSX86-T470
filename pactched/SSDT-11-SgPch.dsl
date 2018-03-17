/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-11-SgPch.aml, Sat Mar 17 09:47:21 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00001627 (5671)
 *     Revision         0x02
 *     Checksum         0xE7
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "SgPch"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "LENOVO", "SgPch", 0x00001000)
{
    External (_PR_.CPU0._PSS, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.DGON, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.DGRT, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC__.GPUT, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC__.TMP0, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.FBEN, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.GEVT, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.TXDS, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.RP01, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP01.PEGP, DeviceObj)    // (from opcode)
    External (DLHR, UnknownObj)    // (from opcode)
    External (DLPW, UnknownObj)    // (from opcode)
    External (EECP, UnknownObj)    // (from opcode)
    External (GBAS, UnknownObj)    // (from opcode)
    External (HRA0, UnknownObj)    // (from opcode)
    External (HRE0, UnknownObj)    // (from opcode)
    External (HRG0, UnknownObj)    // (from opcode)
    External (NVHA, UnknownObj)    // (from opcode)
    External (OSYS, UnknownObj)    // (from opcode)
    External (P8XH, MethodObj)    // 2 Arguments (from opcode)
    External (PNTF, MethodObj)    // 1 Arguments (from opcode)
    External (PWA0, UnknownObj)    // (from opcode)
    External (PWE0, UnknownObj)    // (from opcode)
    External (PWG0, UnknownObj)    // (from opcode)
    External (RPA1, UnknownObj)    // (from opcode)
    External (RPA9, UnknownObj)    // (from opcode)
    External (SGGP, UnknownObj)    // (from opcode)
    External (SGMD, UnknownObj)    // (from opcode)
    External (SWTT, MethodObj)    // 1 Arguments (from opcode)
    External (XBAS, UnknownObj)    // (from opcode)

    Scope (\_SB.PCI0)
    {
        Name (IVID, 0xFFFF)
        Name (ELCT, Zero)
        Name (HVID, Zero)
        Name (HDID, Zero)
        Name (TCNT, Zero)
        Name (LDLY, 0x64)
        Name (RPIX, Zero)
        Name (ONOF, One)
        OperationRegion (RPC1, SystemMemory, (\XBAS + 0x000E0000), 0x1000)
        Field (RPC1, DWordAcc, NoLock, Preserve)
        {
            PVI1,   16, 
            PDI1,   16, 
            PCMR,   8, 
            Offset (0x18), 
            PRB1,   8, 
            SCB1,   8, 
            Offset (0x4A), 
            CEDR,   1, 
            Offset (0x50), 
            ASP1,   2, 
                ,   2, 
            LKD1,   1, 
            Offset (0x69), 
                ,   2, 
            LREN,   1, 
            Offset (0xA4), 
            PWRS,   8, 
            Offset (0x328), 
                ,   19, 
            LKS1,   4
        }

        OperationRegion (RTP1, SystemMemory, (\XBAS + (SCB1 << 0x14)), 0xF0)
        Field (RTP1, AnyAcc, Lock, Preserve)
        {
            DVI1,   16, 
            Offset (0x0B), 
            CBC1,   8, 
            Offset (0x2C), 
            SVI1,   16, 
            SDI1,   16
        }

        OperationRegion (PCA1, SystemMemory, ((\XBAS + (SCB1 << 0x14)) + \EECP), 0x14)
        Field (PCA1, DWordAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCT1,   16
        }

        OperationRegion (PCB1, SystemMemory, (((\XBAS + (SCB1 << 0x14)) + 0x1000) + \EECP), 0x14)
        Field (PCB1, DWordAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCTY,   16
        }

        Method (HGON, 0, Serialized)
        {
            If ((CCHK (One) == Zero))
            {
                Return (Zero)
            }

            ONOF = One
            \_SB.PCI0.LPCB.DGON = One
            If ((OSYS > 0x07D9))
            {
                Sleep (0x08)
            }
            Else
            {
                Sleep (0x10)
            }

            \_SB.PCI0.LPCB.DGRT = One
            Sleep (0x10)
            LKD1 = Zero
            TCNT = Zero
            While ((TCNT < LDLY))
            {
                If ((LKS1 >= 0x07))
                {
                    Break
                }

                Sleep (0x10)
                TCNT += 0x10
            }

            \_SB.PCI0.RP01.PEGP.SVIW = ((HDID << 0x10) | HVID)
            LREN = \_SB.PCI0.RP01.LTRE
            CEDR = One
            \_SB.PCI0.RP01.PEGP.CMDR = \_SB.PCI0.RP01.PEGP.CMDS
            \_SB.PCI0.RP01.PEGP.MLTR = Zero
            LCT1 = ((ELCT & 0x43) | (LCT1 & 0xFFBC))
            \_SB.PCI0.RP01.PEGA.LCT1 = ((ELCT & 0x43) | (\_SB.PCI0.RP01.PEGA.LCT1 & 0xFFBC))
            \SWTT (One)
            Return (Zero)
        }

        Method (HGOF, 0, Serialized)
        {
            P8XH (Zero, 0x14)
            If ((CCHK (Zero) == Zero))
            {
                Return (Zero)
            }

            ONOF = Zero
            \SWTT (Zero)
            ELCT = LCT1
            \_SB.PCI0.RP01.LTRE = LREN
            \_SB.PCI0.RP01.PEGP.CMDS = \_SB.PCI0.RP01.PEGP.CMDR
            LKD1 = One
            TCNT = Zero
            While ((TCNT < LDLY))
            {
                If ((LKS1 == Zero))
                {
                    Break
                }

                Sleep (0x10)
                TCNT += 0x10
            }

            \_SB.PCI0.LPCB.DGRT = Zero
            \_SB.PCI0.LPCB.DGON = Zero
            P8XH (Zero, 0x24)
            Sleep (0x64)
            Return (Zero)
        }

        Method (CCHK, 1, NotSerialized)
        {
            If ((PVI1 == IVID))
            {
                Return (Zero)
            }

            If ((Arg0 == Zero))
            {
                If ((ONOF == Zero))
                {
                    Return (Zero)
                }
            }
            ElseIf ((Arg0 == One))
            {
                If ((ONOF == One))
                {
                    Return (Zero)
                }
            }

            Return (One)
        }
    }

    Scope (\_SB.PCI0.RP01)
    {
        Name (TDGC, Zero)
        Name (DGCX, Zero)
        Name (TGPC, Buffer (0x04)
        {
             0x00                                           
        })
        PowerResource (PC01, 0x00, 0x0000)
        {
            Name (_STA, One)  // _STA: Status
            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                P8XH (Zero, 0x11)
                If ((TDGC == One))
                {
                    If ((DGCX == 0x03))
                    {
                        _STA = One
                        \_SB.PCI0.RP01.PEGP.GC6O ()
                    }
                    ElseIf ((DGCX == 0x04))
                    {
                        _STA = One
                        \_SB.PCI0.RP01.PEGP.GC6O ()
                    }

                    TDGC = Zero
                    DGCX = Zero
                }
                ElseIf ((OSYS != 0x07D9))
                {
                    PCMR = 0x07
                    PWRS = Zero
                    Sleep (0x10)
                    \_SB.PCI0.HGON ()
                    _STA = One
                }

                P8XH (Zero, 0x12)
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                P8XH (Zero, 0x21)
                If ((TDGC == One))
                {
                    CreateField (TGPC, Zero, 0x03, GUPC)
                    If ((ToInteger (GUPC) == One))
                    {
                        \_SB.PCI0.RP01.PEGP.GC6I ()
                        _STA = Zero
                    }
                    ElseIf ((ToInteger (GUPC) == 0x02))
                    {
                        \_SB.PCI0.RP01.PEGP.GC6I ()
                        _STA = Zero
                    }
                }
                ElseIf ((OSYS != 0x07D9))
                {
                    \_SB.PCI0.HGOF ()
                    _STA = Zero
                }

                P8XH (Zero, 0x22)
            }
        }

        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PC01
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            PC01
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PC01
        })
        Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
        {
            Return (0x04)
        }

        Name (WKEN, Zero)
        Name (LTRE, Zero)
        Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
        {
            If (Arg1)
            {
                WKEN = Zero
            }
            ElseIf ((Arg0 && Arg2))
            {
                WKEN = One
            }
            Else
            {
                WKEN = Zero
            }
        }

        Device (PEGP)
        {
            Name (_ADR, Zero)  // _ADR: Address
        }

        Device (PEGA)
        {
            Name (_ADR, One)  // _ADR: Address
            OperationRegion (ACAP, PCI_Config, \EECP, 0x14)
            Field (ACAP, DWordAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                LCT1,   16
            }
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (CMDS, Zero)
        OperationRegion (PCIS, SystemMemory, (\XBAS + (SCB1 << 0x14)), 0x0500)
        Field (PCIS, AnyAcc, Lock, Preserve)
        {
            DVID,   16, 
            Offset (0x04), 
            CMDR,   8, 
            Offset (0x0B), 
            CBCC,   8, 
            Offset (0x2C), 
            SVID,   16, 
            SDID,   16, 
            Offset (0x488), 
                ,   25, 
            MLTR,   1
        }

        Field (PCIS, DWordAcc, Lock, Preserve)
        {
            Offset (0x40), 
            SVIW,   32
        }

        OperationRegion (PCAP, SystemMemory, ((\XBAS + (SCB1 << 0x14)) + \EECP), 0x14)
        Field (PCAP, DWordAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCTL,   16
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            \_SB.PCI0.RP01.PEGP._ADR = Zero
            CMDR = 0x06
            CMDS = 0x06
            HVID = SVID
            HDID = SDID
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_ON, 0, Serialized)  // _ON_: Power On
        {
            \_SB.PCI0.HGON ()
            Return (Zero)
        }

        Method (_OFF, 0, Serialized)  // _OFF: Power Off
        {
            \_SB.PCI0.HGOF ()
            Return (Zero)
        }

        Method (GC6I, 0, Serialized)
        {
            Debug = "<<< GC6I >>>"
            \_SB.PCI0.LPCB.EC.GPUT = One
            Sleep (0x0A)
            LTRE = LREN
            LKD1 = One
            While ((\_SB.PCI0.LPCB.FBEN != One))
            {
                Sleep (One)
            }
        }

        Method (GC6O, 0, Serialized)
        {
            Debug = "<<< GC6O >>>"
            LKD1 = Zero
            \_SB.PCI0.LPCB.GEVT = Zero
            \_SB.PCI0.LPCB.TXDS = Zero
            While ((\_SB.PCI0.LPCB.FBEN != Zero))
            {
                Sleep (One)
            }

            \_SB.PCI0.LPCB.GEVT = One
            While ((LKS1 < 0x07))
            {
                Sleep (One)
            }

            LREN = LTRE
            CEDR = One
            \_SB.PCI0.LPCB.EC.GPUT = Zero
        }

        Method (GETS, 0, Serialized)
        {
            If ((\_SB.PCI0.LPCB.FBEN == Zero))
            {
                Debug = "<<< GETS() return 0x1 >>>"
                Return (One)
            }
            Else
            {
                Debug = "<<< GETS() return 0x3 >>>"
                Return (0x03)
            }
        }

        Method (NGC6, 4, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Debug = "------- GC6 DSM --------"
            If ((Arg1 < 0x0100))
            {
                Return (0x80000001)
            }

            While (One)
            {
                _T_0 = ToInteger (Arg2)
                If ((_T_0 == Zero))
                {
                    Return (Buffer (0x04)
                    {
                         0x1B, 0x00, 0x00, 0x00                         
                    })
                }
                ElseIf ((_T_0 == One))
                {
                    Name (JTB1, Buffer (0x04)
                    {
                         0x00                                           
                    })
                    CreateField (JTB1, Zero, One, JTEN)
                    CreateField (JTB1, One, 0x02, SREN)
                    CreateField (JTB1, 0x03, 0x03, PLPR)
                    CreateField (JTB1, 0x06, 0x02, FBPR)
                    CreateField (JTB1, 0x08, 0x02, GUPR)
                    CreateField (JTB1, 0x0A, One, GC6R)
                    CreateField (JTB1, 0x0B, One, PTRH)
                    CreateField (JTB1, 0x0D, One, MHYB)
                    CreateField (JTB1, 0x0E, One, RPCL)
                    CreateField (JTB1, 0x0F, 0x02, GC6M)
                    CreateField (JTB1, 0x14, 0x0C, JTRV)
                    JTEN = One
                    GC6R = One
                    PTRH = One
                    GC6M = One
                    SREN = One
                    If ((OSYS > 0x07D9))
                    {
                        MHYB = One
                    }

                    JTRV = 0x0103
                    Return (JTB1)
                }
                ElseIf ((_T_0 == 0x02))
                {
                    Debug = "GPS fun 19"
                    Return (Arg3)
                }
                ElseIf ((_T_0 == 0x03))
                {
                    CreateField (Arg3, Zero, 0x03, GUPC)
                    CreateField (Arg3, 0x04, One, PLPC)
                    CreateField (Arg3, 0x0E, 0x02, DFGC)
                    CreateField (Arg3, 0x10, 0x03, GPCX)
                    TGPC = Arg3
                    If (((ToInteger (GUPC) != Zero) || (ToInteger (DFGC) != Zero)))
                    {
                        \_SB.PCI0.RP01.TDGC = ToInteger (DFGC)
                        \_SB.PCI0.RP01.DGCX = ToInteger (GPCX)
                    }

                    Name (JTB3, Buffer (0x04)
                    {
                         0x00                                           
                    })
                    CreateField (JTB3, Zero, 0x03, GUPS)
                    CreateField (JTB3, 0x03, One, GPGS)
                    CreateField (JTB3, 0x07, One, PLST)
                    If ((ToInteger (DFGC) != Zero))
                    {
                        GPGS = One
                        GUPS = One
                        Return (JTB3)
                    }

                    If ((ToInteger (GUPC) == One))
                    {
                        GC6I ()
                        PLST = One
                    }
                    ElseIf ((ToInteger (GUPC) == 0x02))
                    {
                        GC6I ()
                        If ((ToInteger (PLPC) == Zero))
                        {
                            PLST = Zero
                        }
                    }
                    ElseIf ((ToInteger (GUPC) == 0x03))
                    {
                        GC6O ()
                        If ((ToInteger (PLPC) != Zero))
                        {
                            PLST = Zero
                        }
                    }
                    ElseIf ((ToInteger (GUPC) == 0x04))
                    {
                        GC6O ()
                        If ((ToInteger (PLPC) != Zero))
                        {
                            PLST = Zero
                        }
                    }
                    ElseIf ((ToInteger (GUPC) == Zero))
                    {
                        GUPS = GETS ()
                        If ((ToInteger (GUPS) == One))
                        {
                            GPGS = One
                        }
                        Else
                        {
                            GPGS = Zero
                        }
                    }
                    ElseIf ((ToInteger (GUPC) == 0x06)) {}
                    Return (JTB3)
                }
                ElseIf ((_T_0 == 0x04))
                {
                    Return (0x80000002)
                }

                Break
            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0.RP01)
    {
        Method (MSOF, 0, NotSerialized)
        {
        }

        Method (MSON, 0, NotSerialized)
        {
        }

        Method (DGOF, 0, NotSerialized)
        {
        }

        Method (DGON, 0, NotSerialized)
        {
        }
    }

    Scope (\)
    {
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        OperationRegion (NVHM, SystemMemory, NVHA, 0x00020400)
        Field (NVHM, AnyAcc, NoLock, Preserve)
        {
            NVSG,   128, 
            NVSZ,   32, 
            NVVR,   32, 
            NVHO,   32, 
            RVBS,   32, 
            RBF1,   262144, 
            RBF2,   262144, 
            RBF3,   262144, 
            RBF4,   262144
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
        {
            Local0 = Arg0
            Local1 = Arg1
            If ((Local1 > 0x1000))
            {
                Local1 = 0x1000
            }

            If ((Local0 > 0x00020000))
            {
                Return (Buffer (Local1)
                {
                     0x00                                           
                })
            }

            If ((Local0 > RVBS))
            {
                Return (Buffer (Local1)
                {
                     0x00                                           
                })
            }

            Local3 = (Local1 * 0x08)
            Name (ROM1, Buffer (0x8000)
            {
                 0x00                                           
            })
            Name (ROM2, Buffer (Local1)
            {
                 0x00                                           
            })
            If ((Local0 < 0x8000))
            {
                ROM1 = RBF1
            }
            ElseIf ((Local0 < 0x00010000))
            {
                Local0 -= 0x8000
                ROM1 = RBF2
            }
            ElseIf ((Local0 < 0x00018000))
            {
                Local0 -= 0x00010000
                ROM1 = RBF3
            }
            ElseIf ((Local0 < 0x00020000))
            {
                Local0 -= 0x00018000
                ROM1 = RBF4
            }

            Local2 = (Local0 * 0x08)
            CreateField (ROM1, Local2, Local3, TMPB)
            ROM2 = TMPB
            Return (ROM2)
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Method (GOBT, 1, NotSerialized)
        {
            Name (OPVK, Buffer (0xE2)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0040 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0078 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0080 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 00A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 00A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 00B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 00B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 00C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 00D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 00E0 */  0x00, 0x00                                     
            })
            CreateWordField (Arg0, 0x02, USRG)
            If ((USRG == 0x564B))
            {
                Return (OPVK)
            }

            Return (Zero)
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (OMPR, 0x02)
        Name (OPTF, Zero)
        Method (NVOP, 4, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Debug = "------- NV OPTIMUS DSM --------"
            If ((Arg1 != 0x0100))
            {
                Return (0x80000001)
            }

            While (One)
            {
                _T_0 = ToInteger (Arg2)
                If ((_T_0 == Zero))
                {
                    Return (Buffer (0x04)
                    {
                         0x01, 0x00, 0x03, 0x04                         
                    })
                }
                ElseIf ((_T_0 == 0x1A))
                {
                    CreateField (Arg3, 0x18, 0x02, OPCE)
                    CreateField (Arg3, Zero, One, FLCH)
                    If (ToInteger (FLCH))
                    {
                        OMPR = OPCE
                    }

                    Local0 = Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                         
                        }
                    CreateField (Local0, Zero, One, OPEN)
                    CreateField (Local0, 0x03, 0x02, CGCS)
                    CreateField (Local0, 0x06, One, SHPC)
                    CreateField (Local0, 0x18, 0x03, DGPC)
                    CreateField (Local0, 0x1B, 0x02, HDAC)
                    OPEN = One
                    SHPC = One
                    HDAC = 0x02
                    DGPC = One
                    If (\_SB.PCI0.RP01.PEGP._STA ())
                    {
                        CGCS = 0x03
                    }

                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x1B))
                {
                    Local0 = Arg3
                    CreateField (Local0, Zero, One, OPFL)
                    CreateField (Local0, One, One, OPVL)
                    If (ToInteger (OPVL))
                    {
                        OPTF = Zero
                        If (ToInteger (OPFL))
                        {
                            OPTF = One
                        }
                    }

                    Local0 = OPTF
                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x10))
                {
                    Return (\_SB.PCI0.RP01.PEGP.GOBT (Arg3))
                }

                Break
            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (DGOS, Zero)
        OperationRegion (PCNV, PCI_Config, 0x0488, 0x04)
        Field (PCNV, AnyAcc, NoLock, Preserve)
        {
                ,   25, 
            MLTF,   1
        }

        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            If (DGOS)
            {
                \_SB.PCI0.RP01.PEGP._ON ()
                DGOS = Zero
                MLTF = Zero
            }
        }

        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
        {
            If ((\_SB.PCI0.RP01.PEGP.OMPR == 0x03))
            {
                \_SB.PCI0.RP01.PEGP._OFF ()
                DGOS = One
                \_SB.PCI0.RP01.PEGP.OMPR = 0x02
            }
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (CPPC, Zero)
        Method (NVPS, 4, Serialized)
        {
            Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Debug = "------- NV GPS DSM --------"
            While (One)
            {
                _T_0 = ToInteger (Arg2)
                If ((_T_0 == Zero))
                {
                    Local0 = Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
                        }
                    Local3 = Buffer (0x07)
                        {
                             0x00, 0x20, 0x21, 0x22, 0x23, 0x2A, 0xFF       
                        }
                    Local4 = Zero
                    Local5 = DerefOf (Local3 [Local4])
                    While ((Local5 != 0xFF))
                    {
                        Divide (Local5, 0x08, Local2, Local1)
                        Local2 = (One << Local2)
                        Local0 [Local1] = (DerefOf (Local0 [Local1]) | Local2)
                        Local4++
                        Local5 = DerefOf (Local3 [Local4])
                    }

                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x20))
                {
                    Local0 = Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                         
                        }
                    CreateField (Local0, 0x17, One, CPC2)
                    CreateField (Local0, 0x18, One, CUIT)
                    CreateField (Local0, 0x1E, One, PSER)
                    CUIT = One
                    PSER = One
                    CPC2 = One
                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x21))
                {
                    Return (\_PR.CPU0._PSS ())
                }
                ElseIf ((_T_0 == 0x22))
                {
                    CreateField (Arg3, Zero, 0x08, PPCV)
                    CPPC = PPCV
                    \PNTF (0x80)
                    Return (Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                }
                ElseIf ((_T_0 == 0x23))
                {
                    Local0 = Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                         
                        }
                    Local0 [Zero] = CPPC
                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x2A))
                {
                    Local0 = Buffer (0x24)
                        {
                            /* 0000 */  0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
                            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0020 */  0x00, 0x00, 0x00, 0x00                         
                        }
                    Local0 [Zero] = DerefOf (Arg3 [Zero])
                    CreateField (Arg3, Zero, 0x04, QTYP)
                    While (One)
                    {
                        _T_1 = ToInteger (QTYP)
                        If ((_T_1 == Zero))
                        {
                            Local1 = \_SB.PCI0.LPCB.EC.TMP0
                            Local0 [0x0C] = (Local1 & 0xFF)
                            Return (Local0)
                        }
                        ElseIf ((_T_1 == One))
                        {
                            Local0 [0x0D] = 0x08
                            Local0 [One] = 0x03
                            Return (Local0)
                        }
                        ElseIf ((_T_1 == 0x02))
                        {
                            Local0 [One] = 0x03
                            Local0 [0x08] = 0x4B
                            Return (Local0)
                        }

                        Break
                    }
                }

                Break
            }

            Return (Buffer (0x04)
            {
                 0x02, 0x00, 0x00, 0x80                         
            })
        }

        Method (NVST, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.RP01.PEGP, 0x2A)
        }
    }

    Scope (\)
    {
        Method (CMPB, 2, NotSerialized)
        {
            Local1 = SizeOf (Arg0)
            If ((Local1 != SizeOf (Arg1)))
            {
                Return (Zero)
            }

            Local0 = Zero
            While ((Local0 < Local1))
            {
                If ((DerefOf (Arg0 [Local0]) != DerefOf (Arg1 [Local0])))
                {
                    Return (Zero)
                }

                Local0++
            }

            Return (One)
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Name (MXM3, Buffer (0x66)
        {
            /* 0000 */  0x4D, 0x58, 0x4D, 0x5F, 0x03, 0x00, 0x5D, 0x00,
            /* 0008 */  0x30, 0x11, 0xB8, 0xFF, 0xF9, 0x3E, 0x00, 0x00,
            /* 0010 */  0x00, 0x00, 0x0A, 0xF0, 0xF9, 0x3E, 0x00, 0x00,
            /* 0018 */  0x60, 0xE9, 0xD0, 0xFE, 0xF9, 0x3E, 0x00, 0x00,
            /* 0020 */  0x60, 0x6A, 0xDA, 0xFE, 0xF9, 0x3E, 0x00, 0x00,
            /* 0028 */  0x20, 0x2B, 0xE2, 0xFE, 0xF9, 0x3E, 0x00, 0x00,
            /* 0030 */  0x60, 0x6C, 0xEA, 0xFE, 0xF9, 0x3E, 0x00, 0x00,
            /* 0038 */  0x20, 0x6A, 0xDA, 0xFE, 0xF9, 0x3E, 0x00, 0x00,
            /* 0040 */  0x20, 0x6C, 0xEA, 0xFE, 0xF9, 0x3E, 0x00, 0x00,
            /* 0048 */  0x01, 0x90, 0x01, 0x00, 0x03, 0x00, 0x90, 0x01,
            /* 0050 */  0x13, 0x00, 0x90, 0x01, 0xE5, 0x0D, 0x01, 0x01,
            /* 0058 */  0x01, 0x00, 0x00, 0x00, 0xE5, 0x0D, 0x01, 0x03,
            /* 0060 */  0x00, 0x90, 0xD8, 0x09, 0x11, 0x0A             
        })
        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 == ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0")))
            {
                Return (\_SB.PCI0.RP01.PEGP.NVOP (Arg0, Arg1, Arg2, Arg3))
            }

            If ((Arg0 == ToUUID ("a3132d01-8cda-49ba-a52e-bc9d46df6b81")))
            {
                Return (\_SB.PCI0.RP01.PEGP.NVPS (Arg0, Arg1, Arg2, Arg3))
            }

            If ((Arg0 == ToUUID ("cbeca351-067b-4924-9cbd-b46b00b86f34")))
            {
                Return (\_SB.PCI0.RP01.PEGP.NGC6 (Arg0, Arg1, Arg2, Arg3))
            }

            If ((Arg0 == ToUUID ("4004a400-917d-4cf2-b89c-79b62fd55665")))
            {
                Local0 = ToInteger (Arg2)
                If ((Local0 == Zero))
                {
                    Return (Buffer (0x04)
                    {
                         0x01, 0x00, 0x01, 0x01                         
                    })
                }

                If ((Local0 == 0x18))
                {
                    Return (Buffer (0x04)
                    {
                         0x30, 0x00, 0x00, 0x00                         
                    })
                }

                If ((Local0 == 0x10))
                {
                    If ((Arg1 == 0x0300))
                    {
                        Return (MXM3)
                    }
                }

                Return (0x80000002)
            }

            Return (0x80000001)
        }
    }
}

