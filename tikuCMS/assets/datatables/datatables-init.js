var InitiateEditableDataTable = function () {
    return {
        init: function () {
            //Datatable Initiating
            var oTable = $('#datatable-editable').dataTable({
                "searching": false,
                "ordering":false,
                aoColumns: [
                    null,
                    null,
                    null,
                    null,
                    { "bSortable": false }
                ],
                "oLanguage": { //国际化配置
                    "sProcessing": "正在获取数据，请稍后...",
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "没有您要搜索的内容",
                    "sInfo": "从 _START_ 到  _END_ / 总数据数为 _TOTAL_ 条",
                    "sInfoEmpty": "记录数为0",
                    "sInfoFiltered": "(全部记录数 _MAX_ 条)",
                    "sInfoPostFix": "",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "第一页",
                        "sPrevious": "上一页",
                        "sNext": "下一页",
                        "sLast": "最后一页"
                    }
                }

            });

          var isEditing = null;

            //Delete an Existing Row
            $('#datatable-editable').on("click", 'a.delete', function (e) {
                e.preventDefault();
/*
                if (confirm("Are You Sure To Delete This Row?") == false) {
                    return;
                }*/
                var nRow = $(this).parents('tr')[0];
                swal({
                    title: "你确定要删除？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除",
                    cancelButtonText:' 取消',
                    closeOnConfirm: false
                }, function(){
                    oTable.fnDeleteRow(nRow);
                    swal("Deleted!"," 删除成功！", "success");
                });
            });

            //Cancel Editing or Adding a Row
            $('#datatable-editable').on("click", 'a.cancel', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, isEditing);
                    isEditing = null;
                }
            });

            //Edit A Row
            $('#datatable-editable').on("click", 'a.edit', function (e) {
                e.preventDefault();

                var nRow = $(this).parents('tr')[0];

                if (isEditing !== null && isEditing != nRow) {
                    restoreRow(oTable, isEditing);
                    editRow(oTable, nRow);
                    isEditing = nRow;
                } else {
                    editRow(oTable, nRow);
                    isEditing = nRow;
                }
            });

            //Save an Editing Row
            $('#datatable-editable').on("click", 'a.save', function (e) {
                e.preventDefault();
                if (this.innerHTML.indexOf("保存") >= 0) {
                    saveRow(oTable, isEditing);
                    isEditing = null;
                    //Some Code to Highlight Updated Row
                }
            });


            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();
            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
                jqTds[4].innerHTML = '<a href="#" class="on-editing save btn btn-success btn-xs"><i class="fa fa-save"></i>保存</a> <a href="#" class="on-editing cancel btn btn-warning btn-xs"><i class="fa fa-times"></i>取消</a>';
            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate('<a href="#" class="on-default edit btn btn-info btn-xs"><i class="fa fa-pencil"></i>编辑</a><a href="#" class="on-default delete btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>删除</a>', nRow, 4, false);
                oTable.fnDraw();
            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate('<a href="#" class="on-default edit btn btn-info btn-xs"><i class="fa fa-pencil"></i>编辑</a><a href="#" class="on-default delete btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>删除</a>', nRow, 4, false);
                oTable.fnDraw();
            }
        }
    };
}();
