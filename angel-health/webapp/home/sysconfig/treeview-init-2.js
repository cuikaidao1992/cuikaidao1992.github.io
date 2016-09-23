var UITree = function () {

    return {
        //main function to initiate the module
        init: function () {

            var DataSourceTree = function (options) {
                this._data = options.data;
                this._delay = options.delay;
            };

            DataSourceTree.prototype = {

                data: function (options, callback) {
                	
                	//alert(1);
                	
                    var self = this;

                    setTimeout(function () {
                    	
                    	var data;
                    	
                    	if(options.id == 1)
                    		data = [{ name: '综合部 <div class="tree-actions"></div>', type: 'item'},
                    				{ name: '市场部 <div class="tree-actions"></div>', type: 'item'}
                    		];
                        else
                       		data = $.extend(true, [], self._data);

                        callback({ data: data });

                    }, this._delay)
                }
            };

            // INITIALIZING TREE
            var treeDataSource3 = new DataSourceTree({
                data: [
                    { name: '山东总公司 <div class="tree-actions"></div>', id:1, type: 'folder','icon-class':'palegreen' }
                ],
                delay: 400
            });

            $('#MyTree3').tree({
                dataSource: treeDataSource3,
                multiSelect: false,
                loadingHTML: '<div class="tree-loading"><i class="fa fa-rotate-right fa-spin"></i></div>'
            });
			
            
        }

    };

}();