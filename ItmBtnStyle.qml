import QtQuick 2.0
import QtQuick.Controls.Styles 1.4

Item {
    property Component btnStyleDefault: comBtnDefault;


    property Component btnStyleCheckBox: comCheckBox;
    property Component btnStyleLogin: comLogin;
    property Component btnStyleExit: comExit;

    property Component btnStyleWndFullScreen: comFullScreen;
    property Component btnStyleLogger: comLogger;
    property Component btnStyleHelp: comHelp;
    property Component btnStyleLock: comLock;
    property Component btnStyleSystem: comSystem;
    property Component btnStyleWndMin: comWndMin;
    property Component btnStyleWndClose: comWndClose;


    property Component btnStyleMainWndMin: comMainWndMin;
    property Component btnStyleMainWndClose: comMainWndClose;

    property Component btnStyleIrPoint: comIrPoint;
    property Component btnStyleIrLine: comIrLine;
    property Component btnStyleIrRect: comIrRect;
    property Component btnStyleIrSub: comIrSub;
    property Component btnStyleIrAdd: comIrAdd;
    property Component btnStyleIrPalette: comIrPalette;
    property Component btnStyleIrSet: comIrSet;
    property Component btnStyleIrFullscreen: comIrFullScreen;
    property Component btnStyleIrDelette: comIrDelAna;
    property Component btnStyleIrCal: comIrCalibration;
    property Component btnStyleIrPaletteAuto: comIrPaletteAuto;
    property Component btnStyleIrIron: comIrPaletteIron ;
    property Component btnStyleIrRainbow: comIrPaletteRainbow;
    property Component btnStyleIrFeather: comIrPaletteFeather;
    property Component btnStyleIrGray: comIrPaletteGray;
    property Component btnStyleIrIronReverse: comIrPaletteIronReverse;
    property Component btnStyleIrRainbowReverse: comIrPaletteRainbowReverse;
    property Component btnStyleIrFeatherReverse: comIrPaletteFeatherReverse;
    property Component btnStyleIrGrayReverse: comIrPaletteGrayReverse;
    property Component btnStyleIrCapture: comIrCapture;

    property Component btnStyleViFar: comViFar;
    property Component btnStyleViNear: comViNear;
    property Component btnStyleViCapture: comViCapture;
    property Component btnStyleViFullScreen: comViFullScreen;

    property Component btnStyleCruiseStart: comCruiseStart;
    property Component btnStyleCruiseStop : comCruiseStop;

    property Component btnStyleRailLeft: comRailLeft;
    property Component btnStyleRailRight: comRailRight;
    property Component btnStyleRailTop: comRailTop;
    property Component btnStyleRailBottom: comRailBottom;

    property Component btnStylePresetAnaTrend: comPresetAnaTrend;
    property Component btnStyleNoPresetAnaTrend: comNoPresetAnaTrend;
    property Component btnStyleShowAllTrend: comShowAllTrend;
    property Component btnStyleCopyChartTrend: comCopyChartTrend;
    property Component btnStyleReportChartTrendData: comReportChartTrendData;
    property Component btnStyleChartSetParam: comChartSetParam;


    property Component btnStyleRecoverScreen: comRecoverScreen;

    Component {
        id: comBtnDefault;
        ButtonStyle {
            background: Rectangle {
                border.width: control.activeFocus ? 2 : 1;
                border.color: "#888";
                radius: 4;

                color: control.pressed ? "#6B6B6B" :
                                         ( control.hovered ?  "#C6C6C6" :
                                                             ( control.enabled ? "#D0D0D0" : "#555555" ) );




            }


        }
    }

    Component {
        id: comCheckBox;
        CheckBoxStyle {
            indicator: Rectangle {
                    implicitWidth: 16
                    implicitHeight: 16
                    radius: 3
                    border.color: control.activeFocus ? "darkblue" : "gray"
                    border.width: 1
                    Image {
                        anchors.fill: parent;
                        source: "/images/checkbox_normal.png";
                        fillMode: Image.PreserveAspectCrop;
                    }

                    Image {
                        anchors.fill: parent;
                        visible: control.checked;
                        source: "/images/checkbox_press.png";
                        fillMode: Image.PreserveAspectCrop;
                    }
            }
        }
    }

    Component {
        id: comLogin;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_logo_hover.png";
                ms_image_btn_press: "/images/btn_logo_press.png";
                ms_image_btn_release: "/images/btn_logo_normal.png";
                ms_image_btn_disable: "/images/btn_logo_disable.png";
            }
        }
    }

    Component {
        id: comExit;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_exit_hover.png";
                ms_image_btn_press: "/images/btn_exit_press.png";
                ms_image_btn_release: "/images/btn_exit_normal.png";
                ms_image_btn_disable: "/images/btn_exit_disable.png";
            }
        }
    }

    Component {
        id: comFullScreen;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_fullscreen_hover.png";
                ms_image_btn_press: "/images/btn_fullscreen_press.png";
                ms_image_btn_release: "/images/btn_fullscreen_normal.png";
                ms_image_btn_disable: "/images/btn_fullscreen_disable.png";
            }
        }
    }

    Component {
        id: comLogger;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_logger_hover.png";
                ms_image_btn_press: "/images/btn_logger_press.png";
                ms_image_btn_release: "/images/btn_logger_normal.png";
                ms_image_btn_disable: "/images/btn_logger_disable.png";
            }
        }
    }

    Component {
        id: comHelp;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_help_hover.png";
                ms_image_btn_press: "/images/btn_help_press.png";
                ms_image_btn_release: "/images/btn_help_normal.png";
                ms_image_btn_disable: "/images/btn_help_disable.png";
            }
        }
    }

    Component {
        id: comLock;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_lock_hover.png";
                ms_image_btn_press: "/images/btn_lock_press.png";
                ms_image_btn_release: "/images/btn_lock_normal.png";
                ms_image_btn_disable: "/images/btn_lock_disable.png";
            }
        }
    }

    Component {
        id: comSystem;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_system_hover.png";
                ms_image_btn_press: "/images/btn_system_press.png";
                ms_image_btn_release: "/images/btn_system_normal.png";
                ms_image_btn_disable: "/images/btn_system_disable.png";
            }
        }
    }

    Component {
        id: comWndMin;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_logo_min_hover.png";
                ms_image_btn_press: "/images/btn_logo_min_press.png";
                ms_image_btn_release: "/images/btn_logo_min_normal.png";
                ms_image_btn_disable: "/images/btn_logo_min_disable.png";
            }
        }
    }

    Component {
        id: comWndClose;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_logo_close_hover.png";
                ms_image_btn_press: "/images/btn_logo_close_press.png";
                ms_image_btn_release: "/images/btn_logo_close_normal.png";
                ms_image_btn_disable: "/images/btn_logo_close_disable.png";
            }
        }
    }

    Component {
        id: comMainWndMin;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_min_hover.png";
                ms_image_btn_press: "/images/btn_min_press.png";
                ms_image_btn_release: "/images/btn_min_normal.png";
                ms_image_btn_disable: "/images/btn_min_disable.png";
            }
        }
    }

    Component {
        id: comMainWndClose;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_close_hover.png";
                ms_image_btn_press: "/images/btn_close_press.png";
                ms_image_btn_release: "/images/btn_close_normal.png";
                ms_image_btn_disable: "/images/btn_close_disable.png";
            }
        }
    }

    Component {
       id: comIrPoint;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_point_hover.png";
               ms_image_btn_press: "/images/btn_ir_point_press.png";
               ms_image_btn_release: "/images/btn_ir_point_normal.png";
               ms_image_btn_disable: "/images/btn_ir_point_disable.png";
           }
       }
    }

    Component {
       id: comIrLine;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_line_hover.png";
               ms_image_btn_press: "/images/btn_ir_line_press.png";
               ms_image_btn_release: "/images/btn_ir_line_normal.png";
               ms_image_btn_disable: "/images/btn_ir_line_disable.png";
           }
       }
    }

    Component {
       id: comIrRect;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_rect_hover.png";
               ms_image_btn_press: "/images/btn_ir_rect_press.png";
               ms_image_btn_release: "/images/btn_ir_rect_normal.png";
               ms_image_btn_disable: "/images/btn_ir_rect_disable.png";
           }
       }
    }

    Component {
       id: comIrSub;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_sub_hover.png";
               ms_image_btn_press: "/images/btn_ir_sub_press.png";
               ms_image_btn_release: "/images/btn_ir_sub_normal.png";
               ms_image_btn_disable: "/images/btn_ir_sub_disable.png";
           }
       }
    }

    Component {
       id: comIrAdd;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_add_hover.png";
               ms_image_btn_press: "/images/btn_ir_add_press.png";
               ms_image_btn_release: "/images/btn_ir_add_normal.png";
               ms_image_btn_disable: "/images/btn_ir_add_disable.png";
           }
       }
    }

    Component {
       id: comIrPalette;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_palette_hover.png";
               ms_image_btn_press: "/images/btn_ir_palette_press.png";
               ms_image_btn_release: "/images/btn_ir_palette_normal.png";
               ms_image_btn_disable: "/images/btn_ir_palette_disable.png";
           }
       }
    }

    Component {
       id: comIrSet;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_set_hover.png";
               ms_image_btn_press: "/images/btn_ir_set_press.png";
               ms_image_btn_release: "/images/btn_ir_set_normal.png";
               ms_image_btn_disable: "/images/btn_ir_set_disable.png";
           }
       }
    }

    Component {
       id: comIrFullScreen;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_fullscreen_hover.png";
               ms_image_btn_press: "/images/btn_ir_fullscreen_press.png";
               ms_image_btn_release: "/images/btn_ir_fullscreen_normal.png";
               ms_image_btn_disable: "/images/btn_ir_fullscreen_disable.png";
           }
       }
    }

    Component {
       id: comIrDelAna;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_delete_ana_hover.png";
               ms_image_btn_press: "/images/btn_delete_ana_press.png";
               ms_image_btn_release: "/images/btn_delete_ana.png";
               ms_image_btn_disable: "/images/btn_delete_ana_disable.png";
           }
       }
    }

    Component {
       id: comIrCalibration;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_A_hover.png";
               ms_image_btn_press: "/images/btn_ir_A_press.png";
               ms_image_btn_release: "/images/btn_ir_A.png";
               ms_image_btn_disable: "/images/btn_ir_A_disable.png";
           }
       }
    }

    Component {
       id: comIrPaletteAuto;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_auto_hover.png";
               ms_image_btn_press: "/images/btn_auto_press.png";
               ms_image_btn_release: "/images/btn_auto_normal.png";
               ms_image_btn_disable: "/images/btn_auto_disable.png";
           }
       }
    }

    Component {
       id: comIrPaletteIron;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_iron_hover.png";
               ms_image_btn_press: "/images/btn_ir_iron_press.png";
               ms_image_btn_release: "/images/btn_ir_iron_normal.png";
               ms_image_btn_disable: "/images/btn_ir_iron_disable.png";
           }
       }
    }

    Component {
       id: comIrPaletteRainbow;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_rainbow_hover.png";
               ms_image_btn_press: "/images/btn_ir_rainbow_press.png";
               ms_image_btn_release: "/images/btn_ir_rainbow_normal.png";
               ms_image_btn_disable: "/images/btn_ir_rainbow_disable.png";
           }
       }
    }

    Component {
       id: comIrPaletteFeather;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_feather_hover.png";
               ms_image_btn_press: "/images/btn_ir_feather_press.png";
               ms_image_btn_release: "/images/btn_ir_feather_normal.png";
               ms_image_btn_disable: "/images/btn_ir_feather_disable.png";
           }
       }
    }

    Component {
       id: comIrPaletteGray;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_gray_hover.png";
               ms_image_btn_press: "/images/btn_ir_gray_press.png";
               ms_image_btn_release: "/images/btn_ir_gray_normal.png";
               ms_image_btn_disable: "/images/btn_ir_gray_disable.png";
           }
       }
    }

    Component {
       id: comIrPaletteIronReverse;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_iron_reverse_hover.png";
               ms_image_btn_press: "/images/btn_ir_iron_reverse_press.png";
               ms_image_btn_release: "/images/btn_ir_iron_reverse_normal.png";
               ms_image_btn_disable: "/images/btn_ir_iron_reverse_disable.png";
           }
       }
    }

    Component {
       id: comIrPaletteRainbowReverse;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_rainbow_reverse_hover.png";
               ms_image_btn_press: "/images/btn_ir_rainbow_reverse_press.png";
               ms_image_btn_release: "/images/btn_ir_rainbow_reverse_normal.png";
               ms_image_btn_disable: "/images/btn_ir_rainbow_reverse_disable.png";
           }
       }
    }

    Component {
       id: comIrPaletteFeatherReverse;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_feather_reverse_hover.png";
               ms_image_btn_press: "/images/btn_ir_feather_reverse_press.png";
               ms_image_btn_release: "/images/btn_ir_feather_reverse_normal.png";
               ms_image_btn_disable: "/images/btn_ir_feather_reverse_disable.png";
           }
       }
    }

    Component {
       id: comIrPaletteGrayReverse;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_gray_reverse_hover.png";
               ms_image_btn_press: "/images/btn_ir_gray_reverse_press.png";
               ms_image_btn_release: "/images/btn_ir_gray_reverse_normal.png";
               ms_image_btn_disable: "/images/btn_ir_gray_reverse_disable.png";
           }
       }
    }

    Component {
       id: comViFar;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_vi_far_hover.png";
               ms_image_btn_press: "/images/btn_vi_far_press.png";
               ms_image_btn_release: "/images/btn_vi_far_normal.png";
               ms_image_btn_disable: "/images/btn_vi_far_disable.png";
           }
       }
    }

    Component {
       id: comViNear;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_vi_near_hover.png";
               ms_image_btn_press: "/images/btn_vi_near_press.png";
               ms_image_btn_release: "/images/btn_vi_near_normal.png";
               ms_image_btn_disable: "/images/btn_vi_near_disable.png";
           }
       }
    }

    Component {
       id: comIrCapture;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_ir_capture_hover.png";
               ms_image_btn_press: "/images/btn_ir_capture_press.png";
               ms_image_btn_release: "/images/btn_ir_capture_normal.png";
               ms_image_btn_disable: "/images/btn_ir_capture_disable.png";
           }
       }
    }

    Component {
       id: comViCapture;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_vi_capture_hover.png";
               ms_image_btn_press: "/images/btn_vi_capture_press.png";
               ms_image_btn_release: "/images/btn_vi_capture_normal.png";
               ms_image_btn_disable: "/images/btn_vi_capture_disable.png";
           }
       }
    }

    Component {
       id: comViFullScreen;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_vi_fullscreen_hover.png";
               ms_image_btn_press: "/images/btn_vi_fullscreen_press.png";
               ms_image_btn_release: "/images/btn_vi_fullscreen_normal.png";
               ms_image_btn_disable: "/images/btn_vi_fullscreen_disable.png";
           }
       }
    }

    Component {
        id: comRecoverScreen;
        ButtonStyle {
            background: ItmBtnStyleBackground {
                ms_image_btn_hover: "/images/btn_recover_hover.png";
                ms_image_btn_press: "/images/btn_recover_press.png";
                ms_image_btn_release: "/images/btn_recover_normal.png";
                ms_image_btn_disable: "/images/btn_recover_disable.png";
            }
        }
    }

    Component {
       id: comCruiseStart;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/cruise_starting_hover.png";
               ms_image_btn_press: "/images/cruise_starting.png";
               ms_image_btn_release: "/images/cruise_start_normal.png";
               ms_image_btn_disable: "/images/cruise_start_normal.png";
           }
       }
    }

    Component {
       id: comCruiseStop;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/cruise_stop_hover.png";
               ms_image_btn_press: "/images/cruise_stoping.png";
               ms_image_btn_release: "/images/cruise_stop_normal.png";
               ms_image_btn_disable: "/images/cruise_stop_disable.png";
           }
       }
    }

    Component {
       id: comRailLeft;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/rail_left_hover.png";
               ms_image_btn_press: "/images/rail_left_press.png";
               ms_image_btn_release: "/images/rail_left_normal.png";
               ms_image_btn_disable: "/images/rail_left_disable.png";
           }
       }
    }

    Component {
       id: comRailRight;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/rail_right_hover.png";
               ms_image_btn_press: "/images/rail_right_press.png";
               ms_image_btn_release: "/images/rail_right_normal.png";
               ms_image_btn_disable: "/images/rail_right_disable.png";
           }
       }
    }

    Component {
       id: comRailTop;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/rail_top_hover.png";
               ms_image_btn_press: "/images/rail_top_press.png";
               ms_image_btn_release: "/images/rail_top_normal.png";
               ms_image_btn_disable: "/images/rail_top_disable.png";
           }
       }
    }

    Component {
       id: comRailBottom;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/rail_down_hover.png";
               ms_image_btn_press: "/images/rail_down_press.png";
               ms_image_btn_release: "/images/rail_down_normal.png";
               ms_image_btn_disable: "/images/rail_down_disable.png";
           }
       }
    }

    Component {
       id: comPresetAnaTrend;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_chart_preset_curve_hover.png";
               ms_image_btn_press: "/images/btn_chart_preset_curve_press.png";
               ms_image_btn_release: "/images/btn_chart_preset_curve_normal.png";
               ms_image_btn_disable: "/images/btn_chart_preset_curve_disable.png";
           }
       }
    }

    Component {
       id: comNoPresetAnaTrend;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_chart_no_preset_curve_hover.png";
               ms_image_btn_press: "/images/btn_chart_no_preset_curve_press.png";
               ms_image_btn_release: "/images/btn_chart_no_preset_curve_normal.png";
               ms_image_btn_disable: "/images/btn_chart_no_preset_curve_disable.png";
           }
       }
    }

    Component {
       id: comShowAllTrend;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_chart_full_hover.png";
               ms_image_btn_press: "/images/btn_chart_full_press.png";
               ms_image_btn_release: "/images/btn_chart_full_normal.png";
               ms_image_btn_disable: "/images/btn_chart_full_disable.png";
           }
       }
    }

    Component {
       id: comCopyChartTrend;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_chart_cut_hover.png";
               ms_image_btn_press: "/images/btn_chart_cut_press.png";
               ms_image_btn_release: "/images/btn_chart_cut_normal.png";
               ms_image_btn_disable: "/images/btn_chart_cut_disable.png";
           }
       }
    }

    Component {
       id: comReportChartTrendData;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_chart_export_hover.png";
               ms_image_btn_press: "/images/btn_chart_export_press.png";
               ms_image_btn_release: "/images/btn_chart_export_normal.png";
               ms_image_btn_disable: "/images/btn_chart_export_disable.png";
           }
       }
    }

    Component {
       id: comChartSetParam;
       ButtonStyle {
           background: ItmBtnStyleBackground {
               ms_image_btn_hover: "/images/btn_chart_set_hover.png";
               ms_image_btn_press: "/images/btn_chart_set_press.png";
               ms_image_btn_release: "/images/btn_chart_set_normal.png";
               ms_image_btn_disable: "/images/btn_chart_set_disable.png";
           }
       }
    }
}

