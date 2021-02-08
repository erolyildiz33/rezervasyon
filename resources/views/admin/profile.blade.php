@extends('layouts.admin')
@section('content')
<admin-profile :user="{{$user}}"></admin-profile>
@endsection
