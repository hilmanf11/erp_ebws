<!-- TABLE DATAGRID -->
<table id="dg" class="easyui-datagrid" style="width:99.5%;" toolbar="#toolbar">
    <thead>
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'id',width:120,halign:'center'">Part No EBWS</th>
            <th data-options="field:'number',width:200,halign:'center'">Part No Supplier</th>
            <th data-options="field:'item_family_name',width:150,halign:'center'">Product Family</th>
            <th data-options="field:'main_process',width:100,halign:'center'">Process</th>
            <th data-options="field:'uom',width:80,align:'center'">Uom</th>
            <th data-options="field:'wip',width:120,halign:'center',align:'right', formatter:numberformat">WIP Opening</th>
            <th data-options="field:'receipt',width:120,halign:'center',align:'right', formatter:numberformat">Received</th>
            <th data-options="field:'qty_scrap',width:100,halign:'center',align:'right', formatter:numberformat">Scrap</th>
            <th data-options="field:'qty_ng',width:100,halign:'center',align:'right', formatter:numberformat">NG</th>
            <th data-options="field:'qty_fg',width:120,halign:'center',align:'right', formatter:numberformat">Use in FG</th>
            <th data-options="field:'balance',width:120,halign:'center',align:'right', formatter:numberformat,styler:numberStyle">Balance</th>
        </tr>
    </thead>
</table>
<!-- TOOLBAR DATAGRID -->
<div id="toolbar" style="height: 125px; padding: 10px;">
    <fieldset style="width: 100%; border:2px solid #d0d0d0; margin-bottom: 5px; margin-top: 5px; border-radius:4px;">
        <legend><b>Form Filter Data</b></legend>
        <div style="width: 40%;">
            <div class="fitem">
                <span style="width:20%; display:inline-block;">Period</span>
                <input style="width:28%;" id="filter_from" class="easyui-datebox" value="<?= date("Y-m-01") ?>" data-options="formatter:myformatter,parser:myparser, editable:false"> To
                <input style="width:28%;" id="filter_to" class="easyui-datebox" value="<?= date("Y-m-t") ?>" data-options="formatter:myformatter,parser:myparser, editable:false">
                <a href="javascript:;" class="easyui-linkbutton" onclick="filter()"><i class="fa fa-search"></i> Filter Data</a>
            </div>
        </div>
    </fieldset>
    <?= $button ?>
</div>

<iframe id="printout" src="<?= base_url('warehouse/wip_reports/print') ?>" style="width: 100%;" hidden></iframe>
<script>
    function filter() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');

        url = "?filter_from=" + filter_from + "&filter_to=" + filter_to;

        $('#dg').datagrid('loading');

        $.ajax({
            url:'<?= base_url('warehouse/wip_reports/datatables') ?>',
            type:'POST',
            data: {
                filter_from:filter_from,
                filter_to:filter_to
            },
            dataType: 'json',
            success: function(result) { 
                $('#dg').datagrid('loadData',result).datagrid('loaded'); 
            }
        });

        // $("#printout").contents().find('html').html("<center><br><br><br><b style='font-size:20px;'>Please Wait...</b></center>");
        // $("#printout").attr('src', '<?= base_url('warehouse/wip_reports/print') ?>' + url);
    }

    // function excel() {
    //     var filter_from = $("#filter_from").datebox('getValue');
    //     var filter_to = $("#filter_to").datebox('getValue');

    //     url = "?filter_from=" + filter_from + "&filter_to=" + filter_to + "&filter_items=" + filter_items + "&filter_display=" + filter_display;
    //     window.location.assign('<?= base_url('warehouse/wip_reports/print/excel') ?>' + url);
    // }

    //PRINT PDF
    function pdf() {
        // $("#printout").get(0).contentWindow.print();
        $('#dg').datagrid('print','DataGrid');
    }

    //PRINT EXCEL
    function excel() {
        // window.location.assign('<?= base_url('warehouse/wip_reports/print/excel') ?>');
        $('#dg').datagrid('toExcel','wip_reports.xls');
    }

    //RELOAD
    function reload() {
        window.location.reload();
    }

    $(function() {
        //SETTING DATAGRID EASYUI
        $('#dg').datagrid({
            // url: '<?= base_url('warehouse/wip_reports/datatables') ?>',
            pagination: true,
            clientPaging: true,
            // remoteFilter: true,
            rownumbers: true,
            fit: true,
            pageList: [20, 50, 100, 500, 1000],
            pageSize: 20,
        }).datagrid('enableFilter');
    });

    function numberformat(value, row) {
        if (value) {
            const formatter = new Intl.NumberFormat('ja-JP', {
                minimumFractionDigits: 0
            });
            return "<b>" + formatter.format(value) + "</b>";
        }
    }

    function numberStyle(value, row, index) {
        if (value <= 0) {
            return 'background-color:#FFC8C8;';
        } else {
            return 'background-color:#C8FFCC;';
        }
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
</script>