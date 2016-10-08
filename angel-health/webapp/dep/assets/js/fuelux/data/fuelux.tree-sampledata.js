var DataSourceTree = function(options) {
	this._data 	= options.data;
	this._delay = options.delay;
}

DataSourceTree.prototype.data = function(options, callback) {
	var self = this;
	var $data = null;

	if(!("name" in options) && !("type" in options)){
		$data = this._data;//the root tree
		callback({ data: $data });
		return;
	}
	else if("type" in options && options.type == "folder") {
		if("additionalParameters" in options && "children" in options.additionalParameters)
			$data = options.additionalParameters.children;
		else $data = {}//no data
	}
	
	if($data != null)//this setTimeout is only for mimicking some random delay
		setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);

	//we have used static data here
	//but you can retrieve your data dynamically from a server using ajax call
	//checkout examples/treeview.html and examples/treeview.js for more info
};

var tree_data = {
	'for-sale' : {name: '2015.04.21', type: 'folder'}	,
	'vehicles' : {name: '2015.04.20', type: 'folder'}	,
	'rentals' : {name: '2015.04.19', type: 'folder'}	,
	'real-estate' : {name: '2015.04.18', type: 'folder'}	,
	'pets' : {name: '2015.04.17', type: 'folder'},
	'pets1' : {name: '2015.04.17', type: 'folder'}	,
	'pets2' : {name: '2015.04.17', type: 'folder'}		
}
tree_data['for-sale']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '政治', type: 'item'},
		'arts-crafts' : {name: '军事', type: 'item'},
		'clothing' : {name: '经济', type: 'item'},
		'computers' : {name: '娱乐', type: 'item'},
		'jewelry' : {name: '体育', type: 'item'},
		'office-business' : {name: '社会', type: 'item'},
		'sports-fitness' : {name: '文艺', type: 'item'}
	}
}

tree_data['vehicles']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '政治', type: 'item'},
		'arts-crafts' : {name: '军事', type: 'item'},
		'clothing' : {name: '经济', type: 'item'},
		'computers' : {name: '娱乐', type: 'item'},
		'jewelry' : {name: '体育', type: 'item'},
		'office-business' : {name: '社会', type: 'item'},
		'sports-fitness' : {name: '文艺', type: 'item'}
	}
}


tree_data['rentals']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '政治', type: 'item'},
		'arts-crafts' : {name: '军事', type: 'item'},
		'clothing' : {name: '经济', type: 'item'},
		'computers' : {name: '娱乐', type: 'item'},
		'jewelry' : {name: '体育', type: 'item'},
		'office-business' : {name: '社会', type: 'item'},
		'sports-fitness' : {name: '文艺', type: 'item'}
	}
}
tree_data['real-estate']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '政治', type: 'item'},
		'arts-crafts' : {name: '军事', type: 'item'},
		'clothing' : {name: '经济', type: 'item'},
		'computers' : {name: '娱乐', type: 'item'},
		'jewelry' : {name: '体育', type: 'item'},
		'office-business' : {name: '社会', type: 'item'},
		'sports-fitness' : {name: '文艺', type: 'item'}
	}
}
tree_data['pets']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '政治', type: 'item'},
		'arts-crafts' : {name: '军事', type: 'item'},
		'clothing' : {name: '经济', type: 'item'},
		'computers' : {name: '娱乐', type: 'item'},
		'jewelry' : {name: '体育', type: 'item'},
		'office-business' : {name: '社会', type: 'item'},
		'sports-fitness' : {name: '文艺', type: 'item'}
	}
}

tree_data['pets2']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '政治', type: 'item'},
		'arts-crafts' : {name: '军事', type: 'item'},
		'clothing' : {name: '经济', type: 'item'},
		'computers' : {name: '娱乐', type: 'item'},
		'jewelry' : {name: '体育', type: 'item'},
		'office-business' : {name: '社会', type: 'item'},
		'sports-fitness' : {name: '文艺', type: 'item'}
	}
}

tree_data['pets1']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '政治', type: 'item'},
		'arts-crafts' : {name: '军事', type: 'item'},
		'clothing' : {name: '经济', type: 'item'},
		'computers' : {name: '娱乐', type: 'item'},
		'jewelry' : {name: '体育', type: 'item'},
		'office-business' : {name: '社会', type: 'item'},
		'sports-fitness' : {name: '文艺', type: 'item'}
	}
}
var tree_data1 = {
	'for-sale' : {name: '2015年', type: 'folder'}	,
	'vehicles' : {name: '2014年', type: 'folder'}	,
	'rentals' : {name: '2013年', type: 'folder'}	,
	'real-estate' : {name: '2012年', type: 'folder'}	,
	'pets' : {name: '2011年', type: 'folder'},
'pets1' : {name: '2010年', type: 'folder'}	,
'pets2' : {name: '2009年', type: 'folder'}		
}
tree_data1['for-sale']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '2015.1.1', type: 'item'},
		'arts-crafts' : {name: '2015.1.2', type: 'item'},
		'clothing' : {name: '2015.1.3', type: 'item'},
		'computers' : {name: '2015.1.4', type: 'item'},
		'jewelry' : {name: '2015.1.5', type: 'item'},
		'office-business' : {name: '2015.1.5', type: 'item'},
		'sports-fitness' : {name: '2015.1.7', type: 'item'}
	}
}

tree_data1['vehicles']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '2015.1.1', type: 'item'},
		'arts-crafts' : {name: '2015.1.2', type: 'item'},
		'clothing' : {name: '2015.1.3', type: 'item'},
		'computers' : {name: '2015.1.4', type: 'item'},
		'jewelry' : {name: '2015.1.5', type: 'item'},
		'office-business' : {name: '2015.1.5', type: 'item'},
		'sports-fitness' : {name: '2015.1.7', type: 'item'}
	}
}


tree_data1['rentals']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '2015.1.1', type: 'item'},
		'arts-crafts' : {name: '2015.1.2', type: 'item'},
		'clothing' : {name: '2015.1.3', type: 'item'},
		'computers' : {name: '2015.1.4', type: 'item'},
		'jewelry' : {name: '2015.1.5', type: 'item'},
		'office-business' : {name: '2015.1.5', type: 'item'},
		'sports-fitness' : {name: '2015.1.7', type: 'item'}
	}
}
tree_data1['real-estate']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '2015.1.1', type: 'item'},
		'arts-crafts' : {name: '2015.1.2', type: 'item'},
		'clothing' : {name: '2015.1.3', type: 'item'},
		'computers' : {name: '2015.1.4', type: 'item'},
		'jewelry' : {name: '2015.1.5', type: 'item'},
		'office-business' : {name: '2015.1.5', type: 'item'},
		'sports-fitness' : {name: '2015.1.7', type: 'item'}
	}
}
tree_data1['pets']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '2015.1.1', type: 'item'},
		'arts-crafts' : {name: '2015.1.2', type: 'item'},
		'clothing' : {name: '2015.1.3', type: 'item'},
		'computers' : {name: '2015.1.4', type: 'item'},
		'jewelry' : {name: '2015.1.5', type: 'item'},
		'office-business' : {name: '2015.1.5', type: 'item'},
		'sports-fitness' : {name: '2015.1.7', type: 'item'}
	}
}

tree_data1['pets2']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '2015.1.1', type: 'item'},
		'arts-crafts' : {name: '2015.1.2', type: 'item'},
		'clothing' : {name: '2015.1.3', type: 'item'},
		'computers' : {name: '2015.1.4', type: 'item'},
		'jewelry' : {name: '2015.1.5', type: 'item'},
		'office-business' : {name: '2015.1.5', type: 'item'},
		'sports-fitness' : {name: '2015.1.7', type: 'item'}
	}
}

tree_data1['pets1']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: '2015.1.1', type: 'item'},
		'arts-crafts' : {name: '2015.1.2', type: 'item'},
		'clothing' : {name: '2015.1.3', type: 'item'},
		'computers' : {name: '2015.1.4', type: 'item'},
		'jewelry' : {name: '2015.1.5', type: 'item'},
		'office-business' : {name: '2015.1.5', type: 'item'},
		'sports-fitness' : {name: '2015.1.7', type: 'item'}
	}
}


var treeDataSource = new DataSourceTree({data: tree_data});
var treeDataSourcetime = new DataSourceTree({data: tree_data1});
var tree_data3 = {
	'appliances' : {name: '政治', type: 'item'},
		'arts-crafts' : {name: '军事', type: 'item'},
		'clothing' : {name: '经济', type: 'item'},
		'computers' : {name: '娱乐', type: 'item'},
		'jewelry' : {name: '体育', type: 'item'},
		'office-business' : {name: '社会', type: 'item'},
		'sports-fitness' : {name: '文艺', type: 'item'}		
}
var tree_data4 = {
	'appliances' : {name: '新浪', type: 'item'},
		'arts-crafts' : {name: '搜狐', type: 'item'},
		'clothing' : {name: '网易', type: 'item'},
		'computers' : {name: '人民网', type: 'item'},
		'jewelry' : {name: '凤凰网', type: 'item'},
		'office-business' : {name: '腾讯网', type: 'item'},
		'sports-fitness' : {name: 'Facebook', type: 'item'}		
}
var tree_data5 = {
	'appliances' : {name: '新浪', type: 'item'},
		'arts-crafts' : {name: '搜狐', type: 'item'},
		'clothing' : {name: '网易', type: 'item'},
		'computers' : {name: '人民网', type: 'item'},
		'jewelry' : {name: '凤凰网', type: 'item'},
		'office-business' : {name: '腾讯网', type: 'item'},
		'sports-fitness' : {name: 'Facebook', type: 'item'}		
}
var tree_data6 = {
	'appliances' : {name: '新华社', type: 'item'},
		'arts-crafts' : {name: '人民日报', type: 'item'},
		'clothing' : {name: '中新社', type: 'item'},
		'computers' : {name: '北京日报', type: 'item'},
		'jewelry' : {name: '中青报', type: 'item'},
		'office-business' : {name: '首都日报', type: 'item'},
		'sports-fitness' : {name: '信报', type: 'item'}		
}
var treeDataSource3 = new DataSourceTree({data: tree_data3});
var treeDataSource4 = new DataSourceTree({data: tree_data4});
var treeDataSource5 = new DataSourceTree({data: tree_data5});
var treeDataSource6 = new DataSourceTree({data: tree_data6});

var tree_data_2 = {
	'pictures' : {name: 'Pictures', type: 'folder', 'icon-class':'red'}	,
	'music' : {name: 'Music', type: 'folder', 'icon-class':'orange'}	,
	'video' : {name: 'Video', type: 'folder', 'icon-class':'blue'}	,
	'documents' : {name: 'Documents', type: 'folder', 'icon-class':'green'}	,
	'backup' : {name: 'Backup', type: 'folder'}	,
	'readme' : {name: '<i class="icon-file-text grey"></i> ReadMe.txt', type: 'item'},
	'manual' : {name: '<i class="icon-book blue"></i> Manual.html', type: 'item'}
}
tree_data_2['music']['additionalParameters'] = {
	'children' : [
		{name: '<i class="icon-music blue"></i> song1.ogg', type: 'item'},
		{name: '<i class="icon-music blue"></i> song2.ogg', type: 'item'},
		{name: '<i class="icon-music blue"></i> song3.ogg', type: 'item'},
		{name: '<i class="icon-music blue"></i> song4.ogg', type: 'item'},
		{name: '<i class="icon-music blue"></i> song5.ogg', type: 'item'}
	]
}
tree_data_2['video']['additionalParameters'] = {
	'children' : [
		{name: '<i class="icon-film blue"></i> movie1.avi', type: 'item'},
		{name: '<i class="icon-film blue"></i> movie2.avi', type: 'item'},
		{name: '<i class="icon-film blue"></i> movie3.avi', type: 'item'},
		{name: '<i class="icon-film blue"></i> movie4.avi', type: 'item'},
		{name: '<i class="icon-film blue"></i> movie5.avi', type: 'item'}
	]
}
tree_data_2['pictures']['additionalParameters'] = {
	'children' : {
		'wallpapers' : {name: 'Wallpapers', type: 'folder', 'icon-class':'pink'},
		'camera' : {name: 'Camera', type: 'folder', 'icon-class':'pink'}
	}
}
tree_data_2['pictures']['additionalParameters']['children']['wallpapers']['additionalParameters'] = {
	'children' : [
		{name: '<i class="icon-picture green"></i> wallpaper1.jpg', type: 'item'},
		{name: '<i class="icon-picture green"></i> wallpaper2.jpg', type: 'item'},
		{name: '<i class="icon-picture green"></i> wallpaper3.jpg', type: 'item'},
		{name: '<i class="icon-picture green"></i> wallpaper4.jpg', type: 'item'}
	]
}
tree_data_2['pictures']['additionalParameters']['children']['camera']['additionalParameters'] = {
	'children' : [
		{name: '<i class="icon-picture green"></i> photo1.jpg', type: 'item'},
		{name: '<i class="icon-picture green"></i> photo2.jpg', type: 'item'},
		{name: '<i class="icon-picture green"></i> photo3.jpg', type: 'item'},
		{name: '<i class="icon-picture green"></i> photo4.jpg', type: 'item'},
		{name: '<i class="icon-picture green"></i> photo5.jpg', type: 'item'},
		{name: '<i class="icon-picture green"></i> photo6.jpg', type: 'item'}
	]
}


tree_data_2['documents']['additionalParameters'] = {
	'children' : [
		{name: '<i class="icon-file-text red"></i> document1.pdf', type: 'item'},
		{name: '<i class="icon-file-text grey"></i> document2.doc', type: 'item'},
		{name: '<i class="icon-file-text grey"></i> document3.doc', type: 'item'},
		{name: '<i class="icon-file-text red"></i> document4.pdf', type: 'item'},
		{name: '<i class="icon-file-text grey"></i> document5.doc', type: 'item'}
	]
}

tree_data_2['backup']['additionalParameters'] = {
	'children' : [
		{name: '<i class="icon-archive brown"></i> backup1.zip', type: 'item'},
		{name: '<i class="icon-archive brown"></i> backup2.zip', type: 'item'},
		{name: '<i class="icon-archive brown"></i> backup3.zip', type: 'item'},
		{name: '<i class="icon-archive brown"></i> backup4.zip', type: 'item'}
	]
}
var treeDataSource2 = new DataSourceTree({data: tree_data_2});

//分类管理树
var tree_data_fl = {
		'gaoku' : {name: '稿库', type: 'folder'}	,
		'bumen' : {name: '部门', type: 'folder'}	,
		'diqu' : {name: '地区', type: 'folder'}
	}
	tree_data_fl['gaoku']['additionalParameters'] = {
		'children' : {
			'yw' : {name: '要闻', type: 'item'},
			'jj' : {name: '经济 ', type: 'item'},
			'zz' : {name: '政治', type: 'item'},
			'wh' : {name: '文化', type: 'item'},
			'sh' : {name: '社会', type: 'item'},
			'zt' : {name: '事件', type: 'item'},
			'gj' : {name: '国际', type: 'item'},
			'pl' : {name: '评论', type: 'item'},
			'll' : {name: '理论', type: 'item'},
			'wy' : {name: '文艺', type: 'item'},
			'ty' : {name: '体育', type: 'item'},
			'lh' : {name: '两会', type: 'item'}
		}
	}
	tree_data_fl['bumen']['additionalParameters'] = {
		'children' : {
			'bjrb' : {name: '北京日报', type: 'folder'},
			'zgqnb' : {name: '中国青年报', type: 'folder'},
			'jwbs' : {name: '今晚报社', type: 'folder'},
			'hbrb' : {name: '河北日报', type: 'folder'},
			'ybcb' : {name: '延边晨报', type: 'folder'}
		}
	}
	tree_data_fl['bumen']['additionalParameters']['children']['bjrb']['additionalParameters'] = {
		'children' : {
			'zbb' : {name: '总编室', type: 'item'},
			'xwxtb' : {name: '新闻协调部', type: 'item'},
			'dfb' : {name: '地方部', type: 'item'},
			'jjshb' : {name: '经济社会部', type: 'item'},
			'zzwhb' : {name: '政治文化部', type: 'item'},
			'gjb' : {name: '国际部', type: 'item'},
			'wyb' : {name: '文艺部', type: 'item'},
			'tyb' : {name: '体育部', type: 'item'}
		}
	}
	tree_data_fl['bumen']['additionalParameters']['children']['zgqnb']['additionalParameters'] = {
		'children' : {
			'zbb' : {name: '总编室', type: 'item'},
			'xwxtb' : {name: '新闻协调部', type: 'item'},
			'dfb' : {name: '地方部', type: 'item'},
			'jjshb' : {name: '经济社会部', type: 'item'},
			'zzwhb' : {name: '政治文化部', type: 'item'},
			'gjb' : {name: '国际部', type: 'item'},
			'wyb' : {name: '文艺部', type: 'item'},
			'tyb' : {name: '体育部', type: 'item'}
		}
	}
	tree_data_fl['bumen']['additionalParameters']['children']['jwbs']['additionalParameters'] = {
		'children' : {
			'zbb' : {name: '总编室', type: 'item'},
			'xwxtb' : {name: '新闻协调部', type: 'item'},
			'dfb' : {name: '地方部', type: 'item'},
			'jjshb' : {name: '经济社会部', type: 'item'},
			'zzwhb' : {name: '政治文化部', type: 'item'},
			'gjb' : {name: '国际部', type: 'item'},
			'wyb' : {name: '文艺部', type: 'item'},
			'tyb' : {name: '体育部', type: 'item'}
		}
	}
	tree_data_fl['bumen']['additionalParameters']['children']['hbrb']['additionalParameters'] = {
		'children' : {
			'zbb' : {name: '总编室', type: 'item'},
			'xwxtb' : {name: '新闻协调部', type: 'item'},
			'dfb' : {name: '地方部', type: 'item'},
			'jjshb' : {name: '经济社会部', type: 'item'},
			'zzwhb' : {name: '政治文化部', type: 'item'},
			'gjb' : {name: '国际部', type: 'item'},
			'wyb' : {name: '文艺部', type: 'item'},
			'tyb' : {name: '体育部', type: 'item'}
		}
	}
	tree_data_fl['bumen']['additionalParameters']['children']['ybcb']['additionalParameters'] = {
		'children' : {
			'zbb' : {name: '总编室', type: 'item'},
			'xwxtb' : {name: '新闻协调部', type: 'item'},
			'dfb' : {name: '地方部', type: 'item'},
			'jjshb' : {name: '经济社会部', type: 'item'},
			'zzwhb' : {name: '政治文化部', type: 'item'},
			'gjb' : {name: '国际部', type: 'item'},
			'wyb' : {name: '文艺部', type: 'item'},
			'tyb' : {name: '体育部', type: 'item'}
		}
	}
	tree_data_fl['diqu']['additionalParameters'] = {
		'children' : {
			'gn' : {name: '国内', type: 'item'},
			'gj' : {name: '国际', type: 'item'},
		}
	}

	var treeDataSourceFl = new DataSourceTree({data: tree_data_fl});