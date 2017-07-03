import QtQuick.Window 2.2
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Window {
    id: wnd_user_info
    title: qsTr( "软件激活平台" )
    //visibility: Window.Maximized
    visible: false
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight

    modality: Qt.ApplicationModal

    /*
     *  客户显示界面
     */

    Connections {
        target: login

        onSig_ver_success: {
            wnd_user_info.visible = b_ver_success;

            if( wnd_user_info.visible ) {
                customer.user_info_text = login.str_username
            }
        }
    }

    Customer {
        id: customer
        visible: true
    }

    CustomerDetails {
        id: customer_details
        visible: false
    }

    PasswdModify {
        id: passwd_modify
        visible: false
    }

    Connections {
        target: customer
        onSig_clicked_user: {
            if( customer.user_info_text.length != 0 ) {
                customer.visible = false
                customer_details.visible = true
            }
        }

        onSig_return_login: {
            login.show_login( true )
            wnd_user_info.visible = false
            //信息初始化
        }

        onSig_quit: {
            wnd_user_info.close()
        }
    }
}
