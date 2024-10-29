<table id="dg" class="easyui-treegrid" style="width:99.5%;" toolbar="#toolbar">
    <thead>
        <tr>
            <th rowspan="2" field="ck" checkbox="true"></th>
            <th rowspan="2" data-options="field:'id',width:230,halign:'center'">Receipt No</th>
            <th rowspan="2" data-options="field:'total_scan',width:80,align:'center',formatter:statusformat,styler:statusStyle">Status<br>POR</th>
            <th rowspan="2" data-options="field:'status',width:80,align:'center',formatter:statusformatFinance,styler:statusStyleFinance">Status<br>Invoice</th>
            <th rowspan="2" data-options="field:'po_no',width:180,halign:'center'">PO No</th>
            <th rowspan="2" data-options="field:'receipt_date',width:100,halign:'center'">Receipt Date</th>
            <th colspan="2" data-options="field:'coslpan',halign:'center'">Supplier</th>
            <th colspan="2" data-options="field:'coslpan',halign:'center'">Invoice</th>
            <th rowspan="2" data-options="field:'awb_no',width:120,halign:'center'">AWB No</th>
            <th rowspan="2" data-options="field:'awb_date',width:120,halign:'center'">AWB Date</th>
            <th rowspan="2" data-options="field:'item_rm_id',width:150,halign:'center'">Part No EBWS</th>
            <th rowspan="2" data-options="field:'item_rm_number',width:200,halign:'center'">Part No Supplier</th>
            <th rowspan="2" data-options="field:'item_rm_name',width:200,halign:'center'">Description</th>
            <th rowspan="2" data-options="field:'qty_receipt',width:80,halign:'center',align:'right',formatter:numberformat">Qty</th>
            <th rowspan="2" data-options="field:'uom',width:80,halign:'center',align:'center'">UoM</th>
            <th rowspan="2" data-options="field:'currency',width:80,halign:'center',align:'center'">Currency</th>
            <th rowspan="2" data-options="field:'mpq',width:80,halign:'center',align:'right'">MPQ</th>
            <th rowspan="2" data-options="field:'qty_label',width:80,halign:'center',align:'right'">Qty <br> Label</th>
            <th rowspan="2" data-options="field:'state',width:80,align:'center',formatter:BtnPrintLabel">Label</th>
            <th rowspan="2" data-options="field:'attachment',width:100,halign:'center', formatter:btnAttachment">Attachment</th>
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Created</th>
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Updated</th>
        </tr>
        <tr>
            <th data-options="field:'supplier_id',width:80,halign:'center'">ID</th>
            <th data-options="field:'supplier_name',width:200,halign:'center'">Name</th>
            <!-- <th data-options="field:'bc_kind',width:80,halign:'center'">Kind</th> -->
            <!-- <th data-options="field:'bc_aju',width:100,halign:'center'">AJU</th> -->
            <th data-options="field:'bc_document',width:150,halign:'center'">Document</th>
            <th data-options="field:'bc_date',width:80,halign:'center'">Date</th>
            <th data-options="field:'created_by',width:100,align:'center'"> By</th>
            <th data-options="field:'created_date',width:150,align:'center'"> Date</th>
            <th data-options="field:'updated_by',width:100,align:'center'"> By</th>
            <th data-options="field:'updated_date',width:150,align:'center'"> Date</th>
        </tr>
    </thead>
</table>
<div id="toolbar" style="height: 200px; padding:10px;">
    <!-- <div style="width: 100%; display: grid; grid-template-columns: auto auto auto; grid-gap: 5px; display: flex;"> -->
    <div style="width: 100%; display: grid; grid-template-columns: auto auto auto; grid-gap: 5px; display: flex;">
        <fieldset style="width: 65%; border:2px solid #d0d0d0; margin-bottom: 5px; margin-top: 5px; border-radius:4px;">
            <legend><b>Form Filter Data</b></legend>
            <div style="width: 50%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Receipt Date</span>
                    <input style="width:28%;" id="filter_from" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false"> To
                    <input style="width:28%;" id="filter_to" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Supplier</span>
                    <input style="width:60%;" id="filter_supplier" class="easyui-combobox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;"></span>
                    <a href="javascript:;" class="easyui-linkbutton" onclick="filter()"><i class="fa fa-search"></i> Filter Data</a>
                </div>
            </div>
            <div style="width: 50%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Receipt No</span>
                    <input style="width:60%;" id="filter_receipt" class="easyui-combobox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Document No</span>
                    <input style="width:60%;" id="filter_doc_no" class="easyui-combobox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">PO No</span>
                    <input style="width:60%;" id="filter_po_no" class="easyui-combobox">
                </div>
            </div>
        </fieldset>
        <fieldset style="width: 30%; border:2px solid #d0d0d0; margin-bottom: 5px; margin-top: 5px; border-radius:4px;">
            <legend><b>Form Print Data</b></legend>
            <div class="fitem">
                <span style="width:35%; display:inline-block;">Receipt No</span>
                <input style="width:60%;" id="filter_receipt_no" class="easyui-combobox">
            </div>
            <div class="fitem">
                <span style="width:35%; display:inline-block;"></span>
                <a href="javascript:;" class="easyui-linkbutton" onclick="print_receiving_note()"><i class="fa fa-print"></i> Receiving Note</a>
            </div>
        </fieldset>
    </div>
    <?= $button ?>
</div>
<!-- Insert & Update -->
<div id="dlg_insert" class="easyui-dialog" title="Add New" data-options="closed: true,modal:true" style="width: 90%; height: 550px; padding:10px; top: 20px;">
    <form id="frm_insert" method="post" novalidate>
        <fieldset style="width:100%; border:1px solid #d0d0d0; margin-bottom: 10px; border-radius:4px; float: left;">
            <legend><b>Form Data</b></legend>
            <div style="width: 25%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Receipt Date</span>
                    <input style="width:60%;" name="receipt_date" id="receipt_date" required="" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Receipt No</span>
                    <input style="width:60%;" name="receipt_no" id="receipt_no" readonly class="easyui-textbox">
                </div>
                <div class="fitem" hidden>
                    <span style="width:35%; display:inline-block;">Attachment</span>
                    <input style="width:60%;" name="attachment" id="attachment" class="easyui-textbox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Attachment</span>
                    <input style="width:60%;" name="u_attachment" id="u_attachment" class="easyui-filebox" data-options="prompt:'Choose Attachment', accept:'.png, .jpg, .jpeg, .pdf'">
                </div>
                <!-- <div class="fitem">
                    <span style="width:35%; display:inline-block;">BC Kind</span>
                    <input style="width:60%;" name="bc_kind" id="bc_kind" class="easyui-combobox">
                </div> -->
                <!-- <div class="fitem">
                    <span style="width:35%; display:inline-block;">No AJU</span>
                    <input style="width:60%;" name="bc_aju" id="bc_aju" class="easyui-textbox">
                </div> -->
                <div class="fitem">
                    <span style="width:35%; display:inline-block;"></span>
                    <a href="javascript:;" class="easyui-linkbutton" onclick="preview()"><i class="fa fa-search"></i> Preview Data</a>
                </div>
            </div>
            <div style="width: 25%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Supplier</span>
                    <input style="width:60%;" name="supplier_id" id="supplier_id" required="" class="easyui-combogrid">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">PO No</span>
                    <input style="width:60%;" name="po_no" id="po_no" required="" class="easyui-combogrid">
                </div>
            </div>
            <div style="width: 25%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Invoice No</span>
                    <input style="width:60%;" name="bc_document" id="bc_document" required="" class="easyui-textbox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Invoice Date</span>
                    <input style="width:60%;" name="bc_date" id="bc_date" required="" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
            </div>
            <div style="width: 25%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">AWB No</span>
                    <input style="width:60%;" name="awb_no" id="awb_no" class="easyui-textbox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">AWB Date</span>
                    <input style="width:60%;" name="awb_date" id="awb_date" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
            </div>
        </fieldset>
        <table id="dg_request" class="easyui-datagrid" style="width:100%;" title="Purchase Order Receipt List" idField="item_number">
            <thead>
                <tr>
                    <!-- <th field="ck" checkbox="true"></th> -->
                    <th rowspan="2" data-options="field:'item_rm_id',width:150">Part No EBWS</th>
                    <th rowspan="2" data-options="field:'item_rm_number',width:150">Part No Supplier</th>
                    <th rowspan="2" data-options="field:'item_rm_name',width:200">Description</th>
                    <th rowspan="2" data-options="field:'uom',width:80">UoM</th>
                    <th rowspan="2" data-options="field:'qty_po',width:80,editor:{type:'numberbox', options:{readonly:true}}">PO</th>
                    <th rowspan="2" data-options="field:'qty_delivery',width:80,editor:{type:'numberbox', options:{readonly:true}}">Delivery</th>
                    <th rowspan="2" data-options="field:'qty_receipt',width:80,editor:{type:'numberbox'}">Receipt</th>
                    <th rowspan="2" data-options="field:'mpq',width:80,editor:{type:'numberbox', options:{readonly:true}}">MPQ</th>
                    <th rowspan="2" data-options="field:'qty_label',width:80,editor:{type:'numberbox', options:{readonly:true}}">Label</th>
                    <th colspan="3" data-options="field:'t',width:80,halign:'center'">Warehouse</th>
                </tr>
                <tr>
                    <th data-options="field:'location',width:100,editor:{type:'combogrid', options:{required:true, editable:false}}">Location</th>
                    <th data-options="field:'capacity',width:80,editor:{type:'numberbox', options:{readonly:true}}">Available</th>
                    <th data-options="field:'warehouse',width:80,editor:{type:'numberbox', options:{readonly:true}}">Balance</th>
                </tr>
            </thead>
        </table>
    </form>
</div>
<!-- PDF -->
<iframe id="printout" src="<?= base_url('purchase/purchase_order_receipts/print') ?>" style="width: 100%;" hidden></iframe>
<script>
    //Add Data
    function add() {
        $('#dlg_insert').dialog('open');
        $('#dg_request').datagrid('loadData', []);
        $('#frm_insert').form('clear');
        $('#receipt_date').datebox('setValue', '<?= date("Y-m-d") ?>');
        receipt_no();
        // $("#bc_kind").combobox({
        //     url: '<?= base_url('master/bc_kind/reads') ?>',
        //     valueField: 'name',
        //     textField: 'name',
        //     prompt: "Select BC Kind",
        //     panelHeight: "auto"
        // });
        $("#supplier_id").combogrid({
            url: '<?= base_url('purchase/delivery_confirm/readSupplier') ?>',
            panelWidth: 500,
            idField: 'id',
            textField: 'name',
            mode: 'remote',
            fitColumns: true,
            prompt: "Choose Supplier",
            columns: [
                [{
                    field: 'number',
                    title: 'Supplier No',
                    width: 50
                }, {
                    field: 'name',
                    title: 'Supplier Name',
                    width: 200
                }]
            ],
            onSelect: function(valsupp, supp) {
                $('#po_no').combogrid({
                    url: '<?= base_url('purchase/delivery_confirm/readPono?supplier_id=') ?>' + btoa(supp.id),
                    panelWidth: 550,
                    idField: 'po_no',
                    textField: 'po_no',
                    mode: 'remote',
                    fitColumns: true,
                    prompt: "Choose Purchase Order",
                    columns: [
                        [{
                            field: 'po_no',
                            title: 'PO No',
                            width: 120
                        }, {
                            field: 'po_date',
                            title: 'PO Date',
                            width: 110
                        }, {
                            field: 'invoice_no',
                            title: 'Invoice No',
                            width: 120
                        }, {
                            field: 'invoice_date',
                            title: 'Invoice Date',
                            width: 110
                        }]
                    ],
                    onSelect: function(val, row){
                        $("#bc_document").textbox('setValue', row.invoice_no);
                        $("#bc_date").datebox('setValue', row.invoice_date);
                        $("#awb_no").textbox('setValue', row.awb_no);
                        $("#awb_date").datebox('setValue', row.awb_date);
                    }
                });
            }
        });
    }

    function receipt_no(date = "") {
        $.ajax({
            type: "post",
            url: "<?= base_url('purchase/purchase_order_receipts/receipt_no/') ?>" + window.btoa(date),
            dataType: "html",
            success: function(result) {
                $("#receipt_no").textbox('setValue', result);
            }
        });
    }

    function preview() {
        var po_no = $("#po_no").combogrid('getValue');
        if (po_no == "") {
            toastr.warning('Please select PO No', 'Required');
        } else {
            var lastIndex;
            var dg = $('#dg_request').datagrid({
                url: '<?= base_url('purchase/purchase_order_receipts/datatablesTemp') ?>?po_no=' + po_no,
                fitColumns: true,
                singleSelect: true,
                onClickRow: function(rowIndex) {
                    if (lastIndex != rowIndex) {
                        $(this).datagrid('endEdit', lastIndex);
                        $(this).datagrid('beginEdit', rowIndex);
                    }
                    lastIndex = rowIndex;
                },
                onBeginEdit: function(rowIndex, row) {
                    var editors = $('#dg_request').datagrid('getEditors', rowIndex);
                    var qty_po = $(editors[0].target);
                    var qty_delivery = $(editors[1].target);
                    var qty_receipt = $(editors[2].target);
                    var qty_mpq = $(editors[3].target);
                    var qty_label = $(editors[4].target);
                    var location = $(editors[5].target);
                    var capacity = $(editors[6].target);
                    var warehouse = $(editors[7].target);

                    qty_whs = 0;

                    location.combogrid({
                        url: '<?= base_url('master/locations/readLocations?type=RM') ?>',
                        panelWidth: 460,
                        idField: 'number',
                        textField: 'number',
                        mode: 'remote',
                        fitColumns: true,
                        prompt: "Choose Location",
                        columns: [
                            [{
                                field: 'number',
                                title: 'Code',
                                width: 80
                            }, {
                                field: 'location',
                                title: 'Location',
                                width: 150
                            },{
                                field: 'area',
                                title: 'Area',
                                width: 80
                            },{
                                field: 'rack',
                                title: 'Rack',
                                width: 80
                            },{
                                field: 'available',
                                title: 'Available',
                                width: 80
                            }, ]
                        ],
                        onSelect: function(val, loc){
                            var f_qty_receipt = qty_receipt.numberbox('getValue');

                            capacity.numberbox('setValue', loc.available);
                            warehouse.numberbox('setValue', (loc.available - f_qty_receipt));
                            qty_whs = (loc.available - f_qty_receipt);
                        }
                    });

                    qty_receipt.add(qty_mpq).numberbox({
                        onChange: function() {
                            var f_qty_po = qty_po.numberbox('getValue');
                            var f_qty_delivery = qty_delivery.numberbox('getValue');
                            var f_qty_receipt = qty_receipt.numberbox('getValue');
                            var f_qty_mpq = qty_mpq.numberbox('getValue');

                            if (parseInt(f_qty_delivery) == 0) {
                                if (parseInt(f_qty_po) >= parseInt(f_qty_receipt)) {
                                    var cost = Math.ceil(f_qty_receipt / f_qty_mpq);
                                    qty_label.numberbox('setValue', cost);
                                    warehouse.numberbox('setValue', (qty_whs - f_qty_receipt));
                                } else {
                                    qty_receipt.numberbox('setValue', 0);
                                    toastr.warning("Qty Receipt > Qty PO", "Information");
                                    warehouse.numberbox('setValue', (qty_whs - 0));
                                }
                            } else {
                                if (parseInt(f_qty_delivery) >= parseInt(f_qty_receipt)) {
                                    var cost = Math.ceil(f_qty_receipt / f_qty_mpq);
                                    qty_label.numberbox('setValue', cost);
                                    warehouse.numberbox('setValue', (qty_whs - f_qty_receipt));
                                } else {
                                    qty_receipt.numberbox('setValue', 0);
                                    toastr.warning("Qty Receipt > Qty OS PO", "Information");
                                    warehouse.numberbox('setValue', (qty_whs - 0));
                                }
                            }
                        }
                    })
                }
            });
        }
    }

    //Delete Data
    function deleted() {
        var rows = $('#dg').datagrid('getSelections');
        if (rows.length > 0) {
            Swal.fire({
                title: 'Delete Data',
                text: "Are you sure? You want to delete this data!",
                icon: 'warning',
                showCancelButton: true,
                allowOutsideClick: false,
                allowEscapeKey: false,
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Please Wait...',
                        showConfirmButton: false,
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        didOpen: () => {
                            Swal.showLoading();
                        },
                    });

                    requestDelete(rows.length, rows);
                    function requestDelete(total, json, number = 1, value = 0) {
                        if (value < 100) {
                            var row = json[number-1];
                            value = Math.floor((number / total) * 100);

                            if(row.receipt_id){
                                $.ajax({
                                    method: 'post',
                                    url: '<?= base_url('purchase/purchase_order_receipts/delete') ?>',
                                    data: {
                                        id: row.id,
                                        receipt_id: row.receipt_id,
                                        po_no: row.po_no,
                                        item_rm_id: row.item_rm_id,
                                    },
                                    success: function(result) {
                                        var result = eval('(' + result + ')');
                                        requestDelete(total, json, number + 1, value);

                                        if (number == total) {
                                            $('#dg').treegrid('reload');
                                            Swal.close();
                                            Swal.fire(
                                                'Delete Completed',
                                                'Delete Data has been completed, You cannot restore data that has been deleted',
                                                'success'
                                            );
                                        }
                                    },
                                    error: function(jqXHR, textStatus, errorThrown) {
                                        toastr.error("Delete Failed, Please Check Data Relations");
                                        swal.close();
                                    },
                                });
                            }else{
                                toastr.error("Please Delete Detail of the data");
                                Swal.close();
                            }
                        }
                    }
                }
            });
        } else {
            toastr.info("Please select one of the data in the table first");
        }
    }

    function filter() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_supplier = $("#filter_supplier").combobox('getValue');
        var filter_po_no = $("#filter_po_no").combobox('getValue');
        var filter_receipt = $("#filter_receipt").combobox('getValue');
        var filter_doc_no = $("#filter_doc_no").combobox('getValue');
        url = "?filter_from=" + filter_from + "&filter_to=" + filter_to + "&filter_po_no=" + filter_po_no + "&filter_supplier=" + filter_supplier + "&filter_receipt=" + filter_receipt + "&filter_doc_no=" + filter_doc_no;
        $('#dg').treegrid({
            url: '<?= base_url('purchase/purchase_order_receipts/datatables') ?>' + url
        });
        $("#printout").contents().find('html').html("<center><br><br><br><b style='font-size:20px;'>Please Wait...</b></center>");
        $("#printout").attr('src', '<?= base_url('purchase/purchase_order_receipts/print') ?>' + url);
    }

    function pdf() {
        $("#printout").get(0).contentWindow.print();
    }

    function excel() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_supplier = $("#filter_supplier").combobox('getValue');
        var filter_po_no = $("#filter_po_no").combobox('getValue');
        var filter_receipt = $("#filter_receipt").combobox('getValue');
        var filter_doc_no = $("#filter_doc_no").combobox('getValue');
        url = "?filter_from=" + filter_from + "&filter_to=" + filter_to + "&filter_po_no=" + filter_po_no + "&filter_supplier=" + filter_supplier + "&filter_receipt=" + filter_receipt + "&filter_doc_no=" + filter_doc_no;
        window.location.assign('<?= base_url('purchase/purchase_order_receipts/print/excel') ?>' + url);
    }

    function print_receiving_note() {
        var receipt_no = $("#filter_receipt_no").combobox('getValue');
        if (receipt_no == "") {
            toastr.warning("Please select Receipt No!", "Information");
        } else {
        //     $.ajax({
        //         type: "post",
        //         url: "<?= base_url('purchase/purchase_order_receipts/checkLabel/') ?>" + window.btoa(receipt_no),
        //         dataType: "json",
        //         success: function (response) {
                    // if(response.qty_label == response.label_no){
                        window.open("<?= base_url('purchase/purchase_order_receipts/print_receiving/') ?>" + window.btoa(receipt_no), "_blank");
                    // }else{
                        // toastr.error("The labels haven't been scanned yet");
                    // }
        //         }
        //     });            
        }
    }

    function reload() {
        window.location.reload();
    }

    function readReceiptNo() {
        $("#filter_receipt_no").combobox({
            url: '<?= base_url('purchase/purchase_order_receipts/readReceiptNo') ?>',
            valueField: 'receipt_no',
            textField: 'receipt_no',
            prompt: "Select Receipt No",
            icons: [{
                iconCls: 'icon-clear',
                handler: function(e) {
                    $(e.data.target).combobox('clear').combobox('textbox').focus();
                }
            }],
        });
    }

    $(function() {
        $('#dg').treegrid({
            url: '<?= base_url('purchase/purchase_order_receipts/datatables') ?>',
            pagination: true,
            rownumbers: true,
            idField: 'id',
            treeField: 'id',
            fit: true,
            singleSelect: false,
            onBeforeLoad: function(row, param) {
                if (!row) {
                    param.id = 0;
                }
            },
            // rowStyler: function(row) {
            //     if (row.state != "closed") {
            //         return 'background-color:#CFE6FF;';
            //     }
            // },
        });

        $("#u_attachment").filebox({
            onChange: function () {
                var attachment = $("#attachment").textbox('getValue');
                var files = $(this).filebox('files')[0];

                var formData = new FormData();
                formData.append('file', files);

                $.ajax({
                    url: "<?= base_url('purchase/purchase_order_receipts/uploadAttachment/') ?>" + btoa(attachment),
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        var data = JSON.parse(response);
                        toastr.info(data.msg);
                        $("#attachment").textbox('setValue', data.file);
                    }
                });
            }
        })

        //Save Data
        $('#dlg_insert').dialog({
            buttons: [{
                text: 'Save All',
                iconCls: 'icon-ok',
                handler: function() {
                    var receipt_date = $("#receipt_date").datebox('getValue');
                    var receipt_no = $("#receipt_no").textbox('getValue');
                    // var bc_kind = $("#bc_kind").textbox('getValue');
                    // var bc_aju = $("#bc_aju").textbox('getValue');
                    var attachment = $("#attachment").textbox('getValue');
                    var bc_document = $("#bc_document").textbox('getValue');
                    var bc_date = $("#bc_date").datebox('getValue');
                    var awb_no = $("#awb_no").textbox('getValue');
                    var awb_date = $("#awb_date").datebox('getValue');

                    if(receipt_date != "" && receipt_no != "" && bc_document != "" && bc_date != ""){
                        $('#dlg_insert').dialog('close');

                        Swal.fire({
                            title: 'Please Wait...',
                            showConfirmButton: false,
                            allowOutsideClick: false,
                            allowEscapeKey: false,
                            didOpen: () => {
                                Swal.showLoading();
                            },
                        });

                        $('#dg_request').datagrid('acceptChanges');
                        var rows = $('#dg_request').datagrid('getRows');
                        var totalrows = rows.length;
                        // endEditing();

                        requestData(totalrows, rows);
                        function requestData(total, json, number = 1, value = 0, success = 1, failed = 1) {
                            var i = (number - 1);
                            if (value < 100) {
                                value = Math.floor((number / total) * 100);

                                if(json[i].qty_receipt > 0){
                                    if(json[i].warehouse >= 0){
                                        if(json[i].location != "" && json[i].location != null){
                                            $.ajax({
                                                type: "post",
                                                url: '<?= base_url('purchase/purchase_order_receipts/create') ?>',
                                                data: 'item_rm_id=' + json[i].item_rm_id +
                                                    '&supplier_id=' + json[i].supplier_id +
                                                    '&receipt_date=' + receipt_date +
                                                    '&receipt_no=' + receipt_no +
                                                    '&po_no=' + json[i].po_no +
                                                    // '&bc_kind=' + bc_kind +
                                                    // '&bc_aju=' + bc_aju +
                                                    '&attachment=' + attachment +
                                                    '&bc_document=' + bc_document +
                                                    '&bc_date=' + bc_date +
                                                    '&awb_no=' + awb_no +
                                                    '&awb_date=' + awb_date +
                                                    '&location=' + json[i].location +
                                                    '&qty_po=' + json[i].qty_po +
                                                    '&qty_delivery=' + json[i].qty_delivery +
                                                    '&qty_receipt=' + json[i].qty_receipt +
                                                    '&qty_mpq=' + json[i].mpq +
                                                    '&qty_label=' + json[i].qty_label,
                                                dataType: "json",
                                                success: function(result) {
                                                    if (i == (total - 1)) {
                                                        Swal.close();
                                                        Swal.fire({
                                                            title: result.message,
                                                            icon: result.theme,
                                                            confirmButtonText: 'Ok',
                                                            allowOutsideClick: false,
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                // window.location.reload();
                                                                $('#dg').treegrid('reload');
                                                                readReceiptNo();
                                                            }
                                                        });
                                                    }

                                                    requestData(total, json, number + 1, value, success + 1, failed + 0);
                                                },
                                                error: function(){
                                                    toastr.error("Cannot Process your Request");
                                                    requestData(total, json, number + 1, value, success + 1, failed + 0);
                                                }
                                            });
                                        }else{
                                            toastr.error("Location for Part No "+json[i].item_rm_number+" Cannot Empty");
                                            swal.close();
                                        }
                                    }else{
                                        toastr.error("Actual Warehouse for Part No "+json[i].item_rm_number+" is Limited");
                                        swal.close();
                                    }
                                }else{
                                    toastr.error("Qty Receipt for Part No "+json[i].item_rm_number+" <= 0");
                                    swal.close();
                                }
                            }
                        }
                    }else{
                        toastr.error("Please Complete Your input");    
                    }
                }
            }]
        });
        
        $("#receipt_date").datebox({
            onSelect: function(date) {
                receipt_no(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
            }
        });

        readReceiptNo();
        $("#filter_supplier").combobox({
            url: '<?= base_url('purchase/purchase_order_receipts/readSupplier') ?>',
            valueField: 'id',
            textField: 'name',
            prompt: "Select All",
            icons: [{
                iconCls: 'icon-clear',
                handler: function(e) {
                    $(e.data.target).combobox('clear').combobox('textbox').focus();
                }
            }],
            onSelect: function(supp) {
                $("#filter_receipt").combobox({
                    url: '<?= base_url('purchase/purchase_order_receipts/readReceipt/') ?>' + window.btoa(supp.id),
                    valueField: 'receipt_no',
                    textField: 'receipt_no',
                    prompt: "Select Receipt No",
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function(e) {
                            $(e.data.target).combobox('clear').combobox('textbox').focus();
                        }
                    }],
                });
                $("#filter_doc_no").combobox({
                    url: '<?= base_url('purchase/purchase_order_receipts/readDocno/') ?>' + window.btoa(supp.id),
                    valueField: 'bc_document',
                    textField: 'bc_document',
                    prompt: "Select Document No",
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function(e) {
                            $(e.data.target).combobox('clear').combobox('textbox').focus();
                        }
                    }],
                });
                $("#filter_po_no").combobox({
                    url: '<?= base_url('purchase/purchase_order_receipts/readPoNo/') ?>' + window.btoa(supp.id),
                    valueField: 'po_no',
                    textField: 'po_no',
                    prompt: "Select PO No",
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function(e) {
                            $(e.data.target).combobox('clear').combobox('textbox').focus();
                        }
                    }],
                });
            }
        });
    });
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

    function numberformat(value, row) {
        if (value != null) {
            const formatter = new Intl.NumberFormat('ja-JP', {
                minimumFractionDigits: 2
            });
            return "<b>" + formatter.format(value) + "</b>";
        }
    }

    function statusformat(value, row) {
        if (value != null) {
            if (row.total_scan == row.qty_label) {
                return "<b style='color:red;'>CLOSED</b>";
            } else {
                return "<b style='color:green;'>OPEN</b>";
            }
        }
    }

    function statusStyle(value, row, index) {
        if (value != null) {
            if (row.total_scan == row.qty_label) {
                return 'background-color:#FFC8C8;';
            } else {
                return 'background-color:#C8FFCC;';
            }
        }
    }

    function statusformatFinance(value, row) {
        if (value == 1) {
            return "<b style='color:red;'>CLOSED</b>";
        } else {
            return "<b style='color:green;'>OPEN</b>";
        }
    }

    function statusStyleFinance(value, row, index) {
        if (value == 1) {
            return 'background-color:#FFC8C8;';
        } else {
            return 'background-color:#C8FFCC;';
        }
    }

    function btnAttachment(val){
        if(val == null || val == ""){
            return "-";
        }else{
            return "<a class='btn btn-primary btn-sm' style='pointer-events: auto; opacity:1; width:100%;' target='_blank' href='<?= base_url('assets/documents/purchase_order_receipts/') ?>"+val+"'><i class='fa fa-eye'></i> View</a>";
        }
    }

    function BtnPrintLabel(val, row) {
        if (val != "closed") {
            var onClick = "checkQas('"+row.id+"','"+row.bc_document+"','"+row.item_rm_number+"')";
            return '<a class="btn btn-primary w-100" style="pointer-events: visible; opacity:1;" target="_blank" onClick="'+onClick+'"><i class="fa fa-print"></i> Print</a>';

        }
    }

    function checkQas(id, bc_document, item_rm_number){
        Swal.fire({
            title: 'Please Wait...',
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false,
            didOpen: () => {
                Swal.showLoading();
            },
        });

        $.ajax({
            type: "post",
            url: "<?= base_url("purchase/purchase_order_receipts/checkQas") ?>",
            data: "bc_document=" + bc_document + "&item_rm_number=" + item_rm_number,
            dataType: "json",
            success: function (qas) {
                swal.close();

                if(qas == null){
                    toastr.error("Invoice No and Part No in QAS not Found");
                }else{
                    if(qas.label == "OK"){
                        window.open("<?= base_url('purchase/purchase_order_receipts/print_label/') ?>" + window.btoa(id), '_blank');
                    }else{
                        toastr.error("Invoice No and Part No is NG");
                    }
                }
            }
        });
    }
</script>