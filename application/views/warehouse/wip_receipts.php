<table id="dg" class="easyui-datagrid" style="width:99.5%;" toolbar="#toolbar">
    <thead>
        <tr>
            <th rowspan="2" field="ck" checkbox="true"></th>
            <th rowspan="2" data-options="field:'checksheet_number',width:120,align:'center'">Checksheet ID</th>
            <th rowspan="2" data-options="field:'workorder',width:120,align:'center'">Workorder</th>
            <th rowspan="2" data-options="field:'trans_date',width:80,align:'center'">Trans Date</th>
            <th rowspan="2" data-options="field:'wp',width:80,align:'center'">WP</th>
            <th rowspan="2" data-options="field:'item_fg_number',width:150">Product No EBWS</th>
            <th rowspan="2" data-options="field:'number_customer',width:200">Product No Customer</th>
            <th rowspan="2" data-options="field:'item_fg_name',width:200">Description</th>
            <th rowspan="2" data-options="field:'uom',width:80,align:'center'">Uom</th>
            <th rowspan="2" data-options="field:'qty',width:80,halign:'center',align:'right',formatter:numberformat">Qty</th>
            <!-- <th rowspan="2" data-options="field:'lot_label',width:80,halign:'center',align:'right'">Lot Label</th> -->
            <th rowspan="2" data-options="field:'lot_box',width:80,halign:'center',align:'right'">Lot Box</th>
            <!-- <th rowspan="2" data-options="field:'label',width:80,halign:'center',align:'right'">Label Qty</th> -->
            <th rowspan="2" data-options="field:'label_box',width:80,halign:'center',align:'right'">Box Qty</th>
            <!-- <th rowspan="2" data-options="field:'print',width:80,align:'center',formatter:BtnPrint">Label</th> -->
            <th rowspan="2" data-options="field:'print_box',width:80,align:'center',formatter:BtnPrintBox">Box</th>
            <!-- <th rowspan="2" data-options="field:'print_strip',width:80,align:'center',formatter:BtnPrintStrip">Small</th> -->
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Created</th>
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Updated</th>
        </tr>
        <tr>
            <th data-options="field:'created_by',width:100,align:'center'"> By</th>
            <th data-options="field:'created_date',width:150,align:'center'"> Date</th>
            <th data-options="field:'updated_by',width:100,align:'center'"> By</th>
            <th data-options="field:'updated_date',width:150,align:'center'"> Date</th>
        </tr>
    </thead>
</table>
<div id="toolbar" style="height: 200px; padding:10px;">
    <!-- <div style="width: 100%; display: grid; grid-template-columns: auto auto auto; grid-gap: 5px; display: flex;"> -->
    <div style="width: 100%;">
        <fieldset style="width: 35%; border:2px solid #d0d0d0; margin-bottom: 5px; margin-top: 5px; border-radius:4px;">
            <legend><b>Form Filter Data</b></legend>
            <div class="fitem">
                <span style="width:35%; display:inline-block;">Period</span>
                <input style="width:30%;" id="filter_from" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                <input style="width:30%;" id="filter_to" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
            </div>
            <div class="fitem">
                <span style="width:35%; display:inline-block;">Checksheet</span>
                <input style="width:60%;" id="filter_checksheet" class="easyui-combogrid">
            </div>
            <div class="fitem">
                <span style="width:35%; display:inline-block;"></span>
                <a href="javascript:;" class="easyui-linkbutton" onclick="filter()"><i class="fa fa-search"></i> Filter Data</a>
                <a href="javascript:;" class="easyui-linkbutton" onclick="print_rfg()"><i class="fa fa-print"></i> Print Data</a>
            </div>
        </fieldset>
        <?= $button ?>
    </div>
</div>

<!-- Insert & Update -->
<div id="dlg_insert" class="easyui-dialog" title="Add New" data-options="closed: true,modal:true" style="width: 1000px; height: 600px; padding:10px; top: 20px; left: 10px;">
    <form id="frm_insert" method="post" novalidate>
        <fieldset style="width:100%; border:1px solid #d0d0d0; margin-bottom: 10px; border-radius:4px; float: left;">
            <legend><b>Form Data</b></legend>
            <div style="width: 50%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Trans Date</span>
                    <input style="width:40%;" name="trans_date" id="trans_date" required="" data-options="formatter:myformatter,parser:myparser,editable:false" class="easyui-datebox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">RFG ID</span>
                    <input style="width:60%;" name="checksheet_number" id="checksheet_number" readonly required class="easyui-textbox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;"></span>
                    <a href="javascript:;" class="easyui-linkbutton" id="btnPreview" onclick="preview()"><i class="fa fa-search"></i> Preview</a>
                </div>
            </div>
            <div style="width: 50%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Customer Name</span>
                    <input style="width:60%;" name="customer_id" id="customer_id" required="" class="easyui-combobox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Product No</span>
                    <input style="width:60%;" name="item_fg_id" id="item_fg_id" required="" class="easyui-combobox">
                </div>
            </div>
        </fieldset>
        <table id="dg_request" class="easyui-datagrid" style="width:100%;" title="Receiving Finish Good List" idField="item_number">
            <thead>
                <tr>
                    <th field="ck" checkbox="true"></th>
                    <th data-options="field:'workorder',width:250">Work Order</th>
                    <th data-options="field:'period',width:150">Period</th>
                    <th data-options="field:'wp',width:150">WP</th>
                    <th data-options="field:'qty',width:100,editor:{type:'numberbox', options:{required:true}}">Receipt Qty</th>
                    <th data-options="field:'qty_box',width:100,editor:{type:'numberbox', options:{readonly:true}}">Lot Box</th>
                    <th data-options="field:'label_box',width:100,editor:{type:'numberbox', options:{readonly:true}}">Label Box</th>
                </tr>
            </thead>
        </table>
    </form>
</div>

<!-- INSERT LABEL -->
<div id="dlg_label" class="easyui-dialog" title="Create Data Label" data-options="closed: true,modal:true,closable: false" style="width: 500px; padding:10px; top: 20px;">
    <span style="float: left; color:green;">SUCCESS : <b id="p_success">0</b></span><span style="float: right; color:red;"> FAILED : <b id="p_failed">0</b></span>
    <div id="p_upload" class="easyui-progressbar" style="width:100%; margin-top: 10px;"></div>
    <center><b id="p_start">0</b> Of <b id="p_finish">0</b></center>
    <div id="p_remarks" title="History Create Label" class="easyui-panel" style="width:100%; height:300px; padding:10px; margin-top: 10px;">
        <ul id="remarks">

        </ul>
    </div>
</div>

<!-- PDF -->
<iframe id="printout" src="<?= base_url('warehouse/wip_receipts/print') ?>" style="width: 100%;" hidden></iframe>
<script>
    //Add Data
    function add() {
        $('#dlg_insert').dialog('open');
        url_save = '<?= base_url('warehouse/wip_receipts/create') ?>';
        $('#frm_insert').form('clear');
        $("#dg_request").datagrid('loadData', []);

        $("#trans_date").datebox({
            onChange: function(val){
                number(val);

                $('#customer_id').combobox({
                    url: '<?php echo base_url('warehouse/wip_receipts/readCustomer/'); ?>' + btoa(val),
                    valueField: 'customer_id',
                    textField: 'customer_name',
                    prompt: 'Select Customer',
                    onSelect: function(row){
                        $('#item_fg_id').combogrid({
                            url: '<?php echo base_url('warehouse/wip_receipts/readItems/'); ?>' + btoa(row.customer_id) + "/" + btoa(val),
                            panelWidth: 550,
                            idField: 'item_fg_id',
                            textField: 'number_customer',
                            mode: 'remote',
                            fitColumns: true,
                            prompt: "Select Product No",
                            columns: [
                                [{
                                    field: 'item_fg_number',
                                    title: 'Product No EBWS',
                                    width: 150
                                }, {
                                    field: 'number_customer',
                                    title: 'Product No Customer',
                                    width: 200
                                }, {
                                    field: 'item_fg_name',
                                    title: 'Description',
                                    width: 200
                                }]
                            ]
                        });
                    }
                });
            }
        });
    }

    function number(trans_date){
        $.ajax({
            type: "post",
            url: "<?= base_url('warehouse/wip_receipts/number/') ?>" + window.btoa(trans_date),
            dataType: "html",
            success: function(result) {
                $("#checksheet_number").textbox('setValue', result);
            }
        });
    }

    function preview(url = "") {
        var trans_date = $("#trans_date").datebox('getValue');
        var customer_id = $("#customer_id").combobox('getValue');
        var item_fg_id = $("#item_fg_id").combogrid('getValue');

        if(url == ""){
            var urlGet = "<?= base_url('warehouse/wip_receipts/datatablesTemp/') ?>" + btoa(trans_date) + "/" + btoa(customer_id) + "/" + btoa(item_fg_id);
        }else{
            var urlGet = url;
        }

        if (trans_date == "" || customer_id == "" || item_fg_id == "") {
            toastr.warning('Please Select Trans Date, Customer and Product No', 'Required');
        } else {
            var lastIndex;
            var dg = $('#dg_request').datagrid({
                url: urlGet,
                fitColumns: true,
                onClickRow: function(rowIndex) {
                    if (lastIndex != rowIndex) {
                        $(this).datagrid('endEdit', lastIndex);
                        $(this).datagrid('beginEdit', rowIndex);
                    }
                    lastIndex = rowIndex;
                },
                onBeginEdit: function(rowIndex, row) {
                    var editors = $('#dg_request').datagrid('getEditors', rowIndex);
                    var qty_receipt = $(editors[0].target).numberbox('getValue');
                    var qty = $(editors[0].target);
                    var qty_box = $(editors[1].target).numberbox('getValue');
                    var label_box = $(editors[2].target);

                    qty.numberbox({
                        onChange: function(val){
                            if(parseInt(val) < parseInt(qty_box)){
                                toastr.info("Qty Receipt Cannot < Lot Box");
                                qty.numberbox('setValue', qty_receipt);
                            }
                            label_box.numberbox('setValue', Math.round(parseInt(val) / parseInt(qty_box)));
                        }
                    })

                    // sales_order.combobox('setValue', row.sales_order_no);
                }
            });
        }
    }

    //Delete Data
    function deleted() {
        var rows = $('#dg').datagrid('getSelections');
        if (rows.length > 0) {
            $.messager.confirm('Warning', 'Are you sure you want to delete this data?', function(r) {
                if (r) {
                    for (var i = 0; i < rows.length; i++) {
                        var row = rows[i];
                        $.ajax({
                            method: 'post',
                            url: '<?= base_url('warehouse/wip_receipts/delete') ?>',
                            data: {
                                id: row.id,
                                workorder: row.workorder,
                            },
                            success: function(result) {
                                var result = eval('(' + result + ')');
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                toastr.error("This data is already used in other modules, You must delete it First", "Error");
                                
                            },
                            complete: function(data) {
                                $('#dg').datagrid('reload');
                            }
                        });
                    }
                }
            });
        } else {
            toastr.warning("Please select one of the data in the table first!", "Information");
        }
    }

    function filter() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_checksheet = $("#filter_checksheet").combogrid('getValue');

        url = "?filter_from=" + filter_from + "&filter_to=" + filter_to + "&filter_checksheet=" + filter_checksheet;
        $('#dg').datagrid({
            url: '<?= base_url('warehouse/wip_receipts/datatables') ?>' + url
        });
        $("#printout").contents().find('html').html("<center><br><br><br><b style='font-size:20px;'>Please Wait...</b></center>");
        $("#printout").attr('src', '<?= base_url('warehouse/wip_receipts/print') ?>' + url);
    }

    function pdf() {
        $("#printout").get(0).contentWindow.print();
    }

    function excel() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_checksheet = $("#filter_checksheet").combogrid('getValue');

        url = "?filter_from=" + filter_from + "&filter_to=" + filter_to + "&filter_checksheet=" + filter_checksheet;

        window.location.assign('<?= base_url('warehouse/wip_receipts/print/excel') ?>' + url);
    }

    function reload() {
        window.location.reload();
    }

    $(function() {
        $('#dg').datagrid({
            url: '<?= base_url('warehouse/wip_receipts/datatables') ?>',
            pagination: true,
            rownumbers: true,
            fit: true,
            pageList: [10, 50, 100, 500, 1000],
            pageSize: 10,
        });

        $('#dlg_insert').dialog({
            buttons: [{
                text: 'Save All',
                iconCls: 'icon-ok',
                handler: function() {
                    var customer_id = $("#customer_id").combobox('getValue');
                    var trans_date = $("#trans_date").datebox('getValue');
                    var checksheet_number = $("#checksheet_number").textbox('getValue');
                    var item_fg_id = $("#item_fg_id").combogrid('getValue');

                    $('#dg_request').datagrid('acceptChanges');
                    var rows = $('#dg_request').datagrid('getSelections');
                    var totalrows = rows.length;

                    if(totalrows > 0){
                        if (customer_id != "" && trans_date != "" && item_fg_id != "") {
                            $('#dlg_insert').dialog('close');

                            requestData(totalrows, rows);
                            function requestData(total, json, number = 1, value = 0, success = 1, failed = 1) {
                                Swal.fire({
                                    title: 'Please Wait. . .',
                                    showConfirmButton: false,
                                    allowOutsideClick: false,
                                    allowEscapeKey: false,
                                    didOpen: () => {
                                        Swal.showLoading();
                                    },
                                });

                                var i = (number - 1);
                                if (value < 100) {
                                    value = Math.floor((number / total) * 100);
                                    $.ajax({
                                        type: "post",
                                        url: '<?= base_url('warehouse/wip_receipts/create') ?>',
                                        data: {
                                            customer_id: customer_id,
                                            item_fg_id: item_fg_id,
                                            trans_date: trans_date,
                                            checksheet_number: checksheet_number,
                                            workorder: json[i].workorder,
                                            wp: json[i].wp,
                                            qty: json[i].qty,
                                            lot_box: json[i].qty_box,
                                            label_box: json[i].label_box,
                                        },
                                        dataType: "json",
                                        success: function(result) {
                                            if (result.theme == "success") {
                                                if (value >= 100) {
                                                    create_label(checksheet_number, json[i].workorder, json[i].qty, json[i].qty_box, json[i].label_box, total, json, number, value, success, failed, 1);
                                                }else{
                                                    create_label(checksheet_number, json[i].workorder, json[i].qty, json[i].qty_box, json[i].label_box, total, json, number, value, success, failed, 0);
                                                    // requestData(total, json, number + 1, value, success + 1, failed + 0);
                                                }
                                            } else {
                                                if (value >= 100) {
                                                    Swal.close();
                                                    toastr.error(result.message, result.title);
                                                }else{
                                                    toastr.error(result.message, result.title);
                                                    requestData(total, json, number + 1, value, success + 1, failed + 0);
                                                }
                                            }
                                        }
                                    });
                                }
                            }

                            function create_label(checksheet_number, workorder, qty, lot_box, label_box, totalRows, jsonData, numberRows, valueRows, successRows, failedRows, finish){
                                Swal.close();
                                $("#dlg_label").dialog('open');

                                requestDataBox(label_box, qty);
                                function requestDataBox(total, qty, number = 1, value = 0, success = 1, failed = 1) {
                                    if (value < 100) {
                                        value = Math.floor((number / total) * 100);
                                        $('#p_upload').progressbar('setValue', value);
                                        $('#p_start').html(number);
                                        $('#p_finish').html(total);

                                        if (parseInt(qty) > parseInt(lot_box)) {
                                            var qty_final = lot_box;
                                        } else {
                                            var qty_final = qty;
                                        }

                                        $.ajax({
                                            type: "POST",
                                            async: true,
                                            url: "<?= base_url('warehouse/wip_receipts/create_label_box') ?>",
                                            data: {
                                                "checksheet_number": checksheet_number,
                                                "workorder": workorder,
                                                "qty": qty_final,
                                            },
                                            cache: false,
                                            dataType: "json",
                                            success: function(result) {
                                                if (result.theme == "success") {
                                                    $('#p_success').html(success);
                                                    var title = "<b style='color: green;'>" + result.title + "</b> | " + result.message;

                                                    var qty_balance = (parseInt(qty) - parseInt(lot_box));
                                                    requestDataBox(total, qty_balance, number + 1, value, success + 1, failed + 0);
                                                } else {
                                                    $('#p_failed').html(failed);
                                                    var title = "<b style='color: red;'>" + result.title + "</b> | " + result.message;

                                                    var qty_balance = (parseInt(qty) - parseInt(lot_box));
                                                    requestDataBox(total, qty_balance, number + 1, value, success + 0, failed + 1);
                                                }

                                                $("#p_remarks").append(title + "<br>");

                                                // if (value == 100) {
                                                //     requestDataLabel(label, qty);
                                                // }

                                                if (value == 100) {
                                                    $("#dlg_label").dialog('close');
                                                    $('#dg').datagrid('reload');
                                                    toastr.success("Create Label Completed");

                                                    if(finish == 1){
                                                        Swal.fire({
                                                            title: "Create Data Successfully",
                                                            icon: "success",
                                                            confirmButtonText: 'Ok',
                                                            allowOutsideClick: false,
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                window.location.reload();
                                                            }
                                                        });
                                                    }else{
                                                        requestData(totalRows, jsonData, numberRows + 1, valueRows, successRows + 1, failedRows + 0);
                                                    }
                                                    // filter_checksheet();
                                                }
                                            }
                                        }).fail(function(jqXHR, textStatus) {
                                            toastr.error("Connection Time Out, Please Wait");
                                            requestDataBox(total, qty, number, value, success, failed);
                                        });
                                    }
                                }
                            }

                            $('#dg').datagrid('reload');
                            $('#dlg_insert').dialog('close');
                        } else {
                            toastr.error("Please Completed your input");
                        }
                    }else{
                        toastr.warning("Please select one of the data in the table first!", "Information");
                    }
                }
            }]
        });

        //Save Data
        // $('#dlg_insert').dialog({
        //     buttons: [{
        //         text: 'Save',
        //         iconCls: 'icon-ok',
        //         handler: function() {
        //             $('#frm_insert').form('submit', {
        //                 url: url_save,
        //                 onSubmit: function() {
        //                     if ($(this).form('validate') == true) {
        //                         $('#dlg_insert').dialog('close');
        //                         // Swal.fire({
        //                         //     title: 'Please Wait for Create WIP Receipt',
        //                         //     showConfirmButton: false,
        //                         //     allowOutsideClick: false,
        //                         //     allowEscapeKey: false,
        //                         //     didOpen: () => {
        //                         //         Swal.showLoading();
        //                         //     },
        //                         // });
        //                     } else {
        //                         return $(this).form('validate');
        //                     }
        //                 },
        //                 success: function(result) {
        //                     //Swal.close();
        //                     $("#dlg_label").dialog('open');

        //                     var checksheet_number = $("#checksheet_number").combogrid('getValue');
        //                     var qty = $("#qty").numberbox('getValue');
        //                     var lot_box = $("#lot_box").numberbox('getValue');
        //                     var lot_label = $("#lot_label").numberbox('getValue');
        //                     var label_box = $("#label_box").numberbox('getValue');
        //                     var label = $("#label").numberbox('getValue');

        //                     requestDataBox(label_box, qty);

        //                     function requestDataBox(total, qty, number = 1, value = 0, success = 1, failed = 1) {
        //                         if (value < 100) {
        //                             value = Math.floor((number / total) * 100);
        //                             $('#p_upload').progressbar('setValue', value);
        //                             $('#p_start').html(number);
        //                             $('#p_finish').html(total);

        //                             if (parseInt(qty) > parseInt(lot_box)) {
        //                                 var qty_final = lot_box;
        //                             } else {
        //                                 var qty_final = qty;
        //                             }

        //                             $.ajax({
        //                                 type: "POST",
        //                                 async: true,
        //                                 url: "<?= base_url('warehouse/wip_receipts/create_label_box') ?>",
        //                                 data: {
        //                                     "checksheet_number": checksheet_number,
        //                                     "qty": qty_final,
        //                                 },
        //                                 cache: false,
        //                                 dataType: "json",
        //                                 success: function(result) {
        //                                     if (result.theme == "success") {
        //                                         $('#p_success').html(success);
        //                                         var title = "<b style='color: green;'>" + result.title + "</b> | " + result.message;

        //                                         var qty_balance = (parseInt(qty) - parseInt(lot_box));
        //                                         requestDataBox(total, qty_balance, number + 1, value, success + 1, failed + 0);
        //                                     } else {
        //                                         $('#p_failed').html(failed);
        //                                         var title = "<b style='color: red;'>" + result.title + "</b> | " + result.message;

        //                                         var qty_balance = (parseInt(qty) - parseInt(lot_box));
        //                                         requestDataBox(total, qty_balance, number + 1, value, success + 0, failed + 1);
        //                                     }

        //                                     $("#p_remarks").append(title + "<br>");

        //                                     // if (value == 100) {
        //                                     //     requestDataLabel(label, qty);
        //                                     // }

        //                                     if (value == 100) {
        //                                         $("#dlg_label").dialog('close');
        //                                         $('#dg').datagrid('reload');
        //                                         toastr.success("Create Label Completed");
        //                                         filter_checksheet();
        //                                     }
        //                                 }
        //                             }).fail(function(jqXHR, textStatus) {
        //                                 toastr.error("Connection Time Out, Please Wait");
        //                                 requestDataBox(total, qty, number, value, success, failed);
        //                             });
        //                         }
        //                     }

        //                     // function requestDataLabel(total, qty, number = 1, value = 0, success = 1, failed = 1) {
        //                     //     if (value < 100) {
        //                     //         value = Math.floor((number / total) * 100);
        //                     //         $('#p_upload').progressbar('setValue', value);
        //                     //         $('#p_start').html(number);
        //                     //         $('#p_finish').html(total);

        //                     //         if (parseInt(qty) > parseInt(lot_label)) {
        //                     //             var qty_final = lot_label;
        //                     //         } else {
        //                     //             var qty_final = qty;
        //                     //         }

        //                     //         $.ajax({
        //                     //             type: "POST",
        //                     //             async: true,
        //                     //             url: "<?= base_url('warehouse/wip_receipts/create_label') ?>",
        //                     //             data: {
        //                     //                 "checksheet_number": checksheet_number,
        //                     //                 "qty": qty_final,
        //                     //             },
        //                     //             cache: false,
        //                     //             dataType: "json",
        //                     //             success: function(result) {
        //                     //                 if (result.theme == "success") {
        //                     //                     $('#p_success').html(success);
        //                     //                     var title = "<b style='color: green;'>" + result.title + "</b> | " + result.message;

        //                     //                     var qty_balance = (parseInt(qty) - parseInt(lot_label));
        //                     //                     requestDataLabel(total, qty_balance, number + 1, value, success + 1, failed + 0);
        //                     //                 } else {
        //                     //                     $('#p_failed').html(failed);
        //                     //                     var title = "<b style='color: red;'>" + result.title + "</b> | " + result.message;

        //                     //                     var qty_balance = (parseInt(qty) - parseInt(lot_label));
        //                     //                     requestDataLabel(total, qty_balance, number + 1, value, success + 0, failed + 1);
        //                     //                 }

        //                     //                 $("#p_remarks").append(title + "<br>");

        //                     //                 if (value == 100) {
        //                     //                     $("#dlg_label").dialog('close');
        //                     //                     $('#dg').datagrid('reload');
        //                     //                     toastr.success("Create Label Completed");
        //                     //                     filter_checksheet();
        //                     //                 }
        //                     //             }
        //                     //         }).fail(function(jqXHR, textStatus) {
        //                     //             toastr.error("Connection Time Out, Please Wait");
        //                     //             requestDataLabel(total, qty, number, value, success, failed);
        //                     //         });
        //                     //     }
        //                     // }
        //                 }
        //             });
        //         }
        //     }]
        // });

        filter_checksheet();

        $('#receipt').numberbox({
            onChange: function(value) {
                var qty = $("#qty").numberbox("getValue");
                var receipt = $("#receipt").numberbox('getValue');
                var result = parseInt(qty) - parseInt(receipt);
                var balance = $("#balance").numberbox('setValue', result);

                if (result < 0) {
                    toastr.warning("Receipt Qty not minus");
                    $("#receipt").numberbox('setValue', 0);
                } else {
                    return result;
                }
            }
        });
    });

    function filter_checksheet() {
        //Get Product
        $('#filter_checksheet').combogrid({
            url: '<?= base_url('warehouse/wip_receipts/readChecksheet') ?>',
            panelWidth: 650,
            idField: 'checksheet_number',
            textField: 'checksheet_number',
            mode: 'remote',
            fitColumns: true,
            prompt: "Choose Checksheet",
            icons: [{
                iconCls: 'icon-clear',
                handler: function(e) {
                    $(e.data.target).combogrid('clear').combogrid('textbox').focus();
                }
            }],
            columns: [
                [{
                    field: 'checksheet_number',
                    title: 'Checksheet No',
                    width: 150
                }, {
                    field: 'number_customer',
                    title: 'Product No Customer',
                    width: 200,
                }, {
                    field: 'customer_name',
                    title: 'Customer',
                    width: 250,
                }]
            ],
        });
    }

    function print_rfg(){
        var filter_checksheet = $("#filter_checksheet").combogrid('getValue');

        if(filter_checksheet == ""){
            toastr.info("Please Choose Checksheet No");
        }else{
            window.open("<?= base_url('warehouse/wip_receipts/print_checksheet/') ?>" + btoa(filter_checksheet), "_blank");
        }
    }

    function BtnPrint(val, row) {
        return '<a class="btn btn-primary w-100" style="pointer-events: visible; opacity:1;" target="_blank" href="<?= base_url('warehouse/wip_receipts/print_label/') ?>' + window.btoa(row.checksheet_number) + '"><i class="fa fa-print"></i> Print</a>';
    }

    function BtnPrintBox(val, row) {
        return '<a class="btn btn-primary w-100" style="pointer-events: visible; opacity:1;" target="_blank" href="<?= base_url('warehouse/wip_receipts/print_label_box/') ?>' + window.btoa(row.checksheet_number) + '"><i class="fa fa-print"></i> Print</a>';
    }

    function BtnPrintStrip(val, row) {
        return '<a class="btn btn-primary w-100" style="pointer-events: visible; opacity:1;" target="_blank" href="<?= base_url('warehouse/wip_receipts/print_label_strip/') ?>' + window.btoa(row.checksheet_number) + '"><i class="fa fa-print"></i> Print</a>';
    }

    //Format Datepicker
    function myformatter(date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
    }
    //Format Datepicker
    function myparser(s) {
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0], 10);
        var m = parseInt(ss[1], 10);
        var d = parseInt(ss[2], 10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
            return new Date(y, m - 1, d);
        } else {
            return new Date();
        }
    }

    //Number Format Currency
    function numberformat(value, row) {
        const formatter = new Intl.NumberFormat('id-ID', {
            minimumFractionDigits: 2
        });
        return "<b>" + formatter.format(value) + "</b>";
    }
</script>