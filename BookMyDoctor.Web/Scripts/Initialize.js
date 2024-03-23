
$(document).ready(() => {
    $("#btnInitData").on("click", function (event) {
        event.preventDefault();
        initializeData();
       
    });
});
async function ajaxWebMethodCall(requestObj) {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: requestObj.url,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            data: requestObj.data,
            beforeSend: function () {
                $("#loading img").show();
            },
            success: function (r) {
                resolve(r.d);
            },
            error: function (r) {
                reject(r.d);
            },
            complete: function () {
                $("#loading img").hide();
            }
        });
    });
}
async function initializeData() {
    let response = await ajaxWebMethodCall({
        url: 'Initialize.aspx/InitializeData', data: ""
    });
    if (response.IsSuccess) {
        alert(response.Data);
        window.location.href = "Patient.aspx";
    }
    else {
        alert(response.Data);
    }
}