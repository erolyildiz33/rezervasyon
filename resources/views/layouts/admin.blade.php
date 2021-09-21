<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- CSRF Token -->
<meta name="csrf-token" content="{{ csrf_token() }}">

<title>{{ config('app.name', 'Roof14ByDivan') }}</title>
<link href="/css/fontcss.css" rel="stylesheet" />
<!-- Latest compiled and minified CSS -->
<link href="/css/dark.css" rel="stylesheet">


<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/font-awesome1.min.css" rel="stylesheet">


<link rel="stylesheet" href="/css/ionicons.min.css">
<!-- Scripts -->



<script src="{{ asset('/js/app.js') }}" defer></script>

<!-- Fonts -->
<link rel="dns-prefetch" href="//fonts.gstatic.com">
<link href="/css/googlecss.css?family=Nunito" rel="stylesheet">

<!-- Styles -->

<link href="{{ asset('/css/style.css') }}" rel="stylesheet">
<link href="{{ asset('/css/widget.css') }}" rel="stylesheet">
<link href="{{ asset('/css/widget-awesome.css') }}" rel="stylesheet">
<link rel="stylesheet" href="/sweetalert2/dist/sweetalert2.min.css">






<link href="{{asset('dist/bootstrap-table.min.css')}}" rel="stylesheet">

<link href="{{ asset('/css/bootstrap.min.css') }}" rel="stylesheet">
<link href="{{ asset('/css/font-awesome.min.css') }}" rel="stylesheet">
<link href="{{ asset('/css/elegant-icons.css') }}" rel="stylesheet">
<link href="{{ asset('/css/jquery-ui.min.css') }}" rel="stylesheet">
<link href="{{ asset('/css/nice-select.css') }}" rel="stylesheet">
<link href="{{ asset('/css/owl.carousel.min.css') }}" rel="stylesheet">
<link href="{{ asset('/css/magnific-popup.css') }}" rel="stylesheet">
<link href="{{ asset('/css/slicknav.min.css') }}" rel="stylesheet">
<link href="/css/bootstrap4-toggle.min.css" rel="stylesheet">

</head>

<body>
<div id="app">
<nav class="navbar navbar-dark bg-dark navbar-expand-lg navbar-light bg-light">
<a href="./index.html">
                    <img src="/img/logo.png" class="rounded-circle" alt="" width="100" height="70">
                </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto w-100 justify-content-between">
      <li class="nav-item active">
      <a href="{{ route('admin.index') }}" class="nav-link">Yönetim Paneli</a>
       
      </li>
      <li class="nav-item">
      <a href="{{ route('admin.table') }}" class="nav-link">Müşteri Tanımla</a>
      </li>
      <li class="nav-item">
      <a href="{{ route('admin.durum') }}" class="nav-link">Masa Durumu</a>
      </li>
      <li class="nav-item">
      <a href="{{ route('admin.event') }}" class="nav-link">Event Tanımla</a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Raporlar
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
       
          <a class="dropdown-item" href="{{ route('admin.rapor') }}">Tüm Rapor</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="{{ route('admin.bugun') }}">Bugün Raporu</a>
          <a class="dropdown-item" href="{{ route('admin.gecmis') }}">Geçmiş Raporu</a>
          <a class="dropdown-item" href="#">İptal Raporu</a>
          <a class="dropdown-item" href="#">Gelecek Raporu</a>
          <a class="dropdown-item" href="#">Bekleyen Raporu</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Otel Raporu</a>
          <a class="dropdown-item" href="#">Yerel Raporu</a>

          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Doğum Günü Raporu</a>
          <a class="dropdown-item" href="#">Evlilik Günü Raporu</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="{{ route('admin.geribildirim') }}">Geri Bildirim Raporu</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span>Kullanıcı :</span>
                                        <label id="logidUserid">{{session()->get('user_name')}}</label>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
    {{ csrf_field() }}
</form>
        <button href="{{ route('logout') }}" class="dropdown-item" onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();">
                                            Çıkış
                                        </button>
        </div>
      </li>
                                  
                                   
                                      <li>
                                    <div>
                                    <admin-bell />
                                </div>
                                    </li>
                                    <li>
                                      
                                    </li>
    </ul>
 
  </div>
</nav>
<section>
            <div class="container">




                <main class="mt-4">
                    @yield('content')
                </main>



            </div>
        </section>

</div> 
       
    
    <script src="/js/jquery-3.5.1.js"></script>
<script src="/js/bootstrap.bundle.js"></script>




<script src="/js/jquery-2.2.4.js"></script>
    <script src="/js/jquery.magnific-popup.min.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/jquery.richtext.min.js"></script>
    <script src="/js/image-uploader.min.js"></script>
    <script src="/js/main.js"></script>

    

   

    <script src="/js/tableExport.min.js"></script>
    <script src="/dist/bootstrap-table.min.js"></script>
    <script src="/dist/locale/bootstrap-table-tr-TR.js"></script>
    <script src="/js/bootstrap-table-vue.min.js"></script>
    <script src="/js/bootstrap-table-export.min.js"></script>
    <script src="/js/jspdf.min.js"></script>
    <script src="/js/jspdfpluginautotable.min.js"></script>
    <script src="/js/bootstrap-table-filter-control.min.js"></script>
    <script src="/sweetalert2/dist/sweetalert2.all.min.js"></script>


   





</body>

</html>