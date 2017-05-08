/**
 * Created by Administrator on 2017/4/24.
 */
/*公用头部*/
Vue.component('topbar', {
    template: `<div class="topbar">
        <!-- LOGO -->
        <div class="topbar-left">
            <div class="text-center">
                <a href="index.html" class="logo"><i class="md md-bookmark"></i> <span>题库后台管理 </span></a>
            </div>
        </div>
        <!-- Button mobile view to collapse sidebar menu -->
        <div class="navbar navbar-default" role="navigation">
            <div class="container">
                <div class="">
                    <div class="pull-left">
                        <button class="button-menu-mobile open-left">
                            <i class="fa fa-bars"></i>
                        </button>
                        <span class="clearfix"></span>
                    </div>
                    <form class="navbar-form pull-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control search-bar" placeholder="请输入要查询的内容.....">
                        </div>
                        <button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
                    </form>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>`
});
/*公用左侧*/
Vue.component('side-menu', {
    template: `<div class="left side-menu">
        <div class="sidebar-inner slimscrollleft">
            <div class="user-details">
                <div class="pull-left">
                    <img src="images/users/avatar-1.jpg" alt="" class="thumb-md img-circle">
                </div>
                <div class="user-info">
                    <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">xuehuiwang <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0)"><i class="md md-face-unlock"></i> 修改头像<div class="ripple-wrapper"></div></a></li>
                            <li><a href="javascript:void(0)"><i class="md md-lock"></i> 修改密码</a></li>
                            <li><a href="javascript:void(0)"><i class="md md-settings-power"></i> 安全退出</a></li>
                        </ul>
                    </div>

                    <p class="text-muted m-0">Administrator</p>
                </div>
            </div>
            <!--- Divider -->
            <div id="sidebar-menu">
                <ul>
                    <li>
                        <a href="index.html" class="waves-effect"><i class="md md-view-array"></i><span> 题库管理 </span></a>
                    </li>                
                    <li>
                        <a href="#" class="waves-effect"><i class="md md-content-paste"></i><span>考试测评</span></a>
                    </li>
                    <li>
                        <a href="paperType.html" class="waves-effect"><i class="md md-dashboard"></i><span>做题类型</span></a>
                    </li>
                    <li>
                        <a href="practice.html" class="waves-effect"><i class="md md-description"></i><span>作业</span></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>`
});