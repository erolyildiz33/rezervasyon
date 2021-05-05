@extends('layouts.admin')
@section('content')

<admin-widget :renk={{$info}} :icon={{$bookmark-o}} :baslik={{$baslık}} :deger={{$dgr1}} :aciklama={{$aciklama1}}></admin-widget>
<admin-widget :renk={{$success}} :icon={{$thumbs-up}} :baslik={{$baslık2}} :deger={{$dgr2}} :aciklama={{$aciklama2}}></admin-widget>




@endsection