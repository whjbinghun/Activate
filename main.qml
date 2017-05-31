import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1

Window {
    id: wnd_user_info
    title: qsTr( "软件激活平台" )
    visible: false

    property int n_width: 320
    property int n_height: 580

    width: n_width
    height: n_height

    modality: Qt.ApplicationModal
    //flags: Qt.MSWindowsFixedSizeDialogHint | Qt.WindowCloseButtonHint

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

    ActiveInfoDetails {
        id: active_info_details
        visible: false
    }

    ActiveInfoSuccess {
        id: active_info_success
        visible: false
    }

    SeeActiveInfo {
        id: see_active_info
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
    }

}
