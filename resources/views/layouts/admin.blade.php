
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Roof14ByDivan') }}</title>
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,700&display=swap" rel="stylesheet"/>
    <!-- Latest compiled and minified CSS -->
    <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
    
 
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Scripts -->
   
   

    <script src="{{ asset('/js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    
    <link href="{{ asset('/css/style.css') }}" rel="stylesheet">
   



    <link href="{{asset('dist/bootstrap-table.min.css')}}" rel="stylesheet">
    
    <link href="{{ asset('/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('/css/font-awesome.min.css') }}" rel="stylesheet">
    <link href="{{ asset('/css/elegant-icons.css') }}" rel="stylesheet">
    <link href="{{ asset('/css/jquery-ui.min.css') }}" rel="stylesheet">
    <link href="{{ asset('/css/nice-select.css') }}" rel="stylesheet">
    <link href="{{ asset('/css/owl.carousel.min.css') }}" rel="stylesheet">
    <link href="{{ asset('/css/magnific-popup.css') }}" rel="stylesheet">
    <link href="{{ asset('/css/slicknav.min.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.0/css/bootstrap4-toggle.min.css" rel="stylesheet">

</head>
<body>
    <div id="app">
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="canvas-close">
            <span class="icon_close"></span>
        </div>
        <div class="logo">
            <a href="./index.html">
                <img src="/img/logo.png" alt="">
            </a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="om-widget">
            
            <a href="#" class="hw-btn">Rezevasyon Takip</a>
        </div>
        <div class="om-social">
        <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                    @auth
                            <li>
                                <a href="{{ route('admin.index') }}">Yönetim Paneli</a>
                            </li>
                          
                             <li>
                               <a href="{{ route('admin.table') }}">Müşteri Tanımla</a>
                            </li>
                            <li>
                                <a href="{{ route('anasayfa') }}">Rezervasyon Tanımla</a>
                            </li>
                            <li>
                                <a href="{{ route('admin.event') }}">Event Tanımla</a>
                            </li>
                           
                           
                            <li>
                                <a  href="{{ route('logout') }}"
                                   onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();">
                                  Çıkış
                                </a>
                            </li>
                           
                           <span>Kullanıcı :</span>
                                <label>{{session()->get('user_id')}}</label>
                           
                            
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        @else
                        <li>
                            <a href="{{ route('detail') }}">Randevu Takip</a>
                        </li>


                        @endauth
                    </ul>
                </div><!--/.nav-collapse -->
           
        </div>
    </div>
    <!-- Offcanvas Menu Wrapper End -->

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="hs-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2">
                       <div class="logo">
                            <a href="./index.html"><img src="/img/logo.png" alt="" width="100" height="70"></a>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="ht-widget">
                        <ul class="nav navbar-nav">
                        @auth
                        
                            <li>
                                <a href="{{ route('admin.index') }}" class="btn btn-dark">Yönetim Paneli</a>
                            </li>
                          
                             <li>
                               <a href="{{ route('admin.table') }}" class="btn btn-dark">Müşteri Tanımla</a>
                            </li>
                            <li>
                                <a href="{{ route('admin.durum') }}" class="btn btn-dark">Masa Durumu</a>
                            </li>
                            <li>
                                <a href="{{ route('admin.event') }}" class="btn btn-dark">Event Tanımla</a>
                            </li>
                            <li>
                                <a href="{{ route('admin.event') }}" class="btn btn-dark">Raporlar</a>
                            </li>
                           
                           
                          
                           <li>
                           <span>Kullanıcı :</span>
                                <label id="logidUserid" >{{session()->get('user_name')}}</label>
                           
                            
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                           </li>
                           <li>
                                <a  href="{{ route('logout') }}" class="btn btn-danger"
                                   onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();">
                                  Çıkış
                                </a>
                            </li>
                        @else
                        <li>
                            <a href="{{ route('detail') }}">Randevu Takip</a>
                        </li>


                        @endauth
                    </ul>

                           
                        </div>
                    </div>
                </div>
                <div class="canvas-open">
                    <span class="icon_menu"></span>
                </div>
            </div>
        </div>
       
    </header>
    <!-- Header End -->

    <!-- Hero Section Begin -->
  
    <!-- Hero Section End -->

    <!-- Search Section Begin -->
    <section>
        <div class="container">
           
            <div id="app">
                

                <main class="py-14">
                    @yield('content')
                </main>
              
            </div>
            
        </div>
    </section>


    <!-- Footer Section Begin -->
   
      
        </div>
    </footer>
    <!-- Footer Section End -->
    <!-- Js Plugins -->
   
    
   
   

       
    </div>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.magnific-popup.min.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/jquery.richtext.min.js"></script>
    <script src="/js/image-uploader.min.js"></script>
    <script src="/js/main.js"></script>

    <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
    <script src="/dist/bootstrap-table.min.js"></script>
    <script src="/dist/locale/bootstrap-table-tr-TR.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.18.0/dist/bootstrap-table-vue.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.18.1/dist/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  
   




</body>
</html>

