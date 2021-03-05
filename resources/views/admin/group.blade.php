@extends('layouts.admin')
@section('content')
<admin-group :userid="{{$kullanici}}"></admin-group>
@endsection