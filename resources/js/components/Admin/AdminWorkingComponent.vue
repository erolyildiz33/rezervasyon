<template>
    <div class="container">
        <div class="row">

            <div class="col-md-12">

                <admin-working-item day="monday" @add="add" title="Pazartesi" :working="monday"></admin-working-item>
                <admin-working-item day="tuesday" @add="add" title="Salı" :working="tuesday"></admin-working-item>
                <admin-working-item day="wednesday" @add="add" title="Çarşamba"
                                    :working="wednesday"></admin-working-item>
                <admin-working-item day="thursday" @add="add" title="Perşembe" :working="thursday"></admin-working-item>
                <admin-working-item day="friday" @add="add" title="Cuma" :working="friday"></admin-working-item>
                <admin-working-item day="saturday" @add="add" title="Cumartesi"
                                    :working="saturday"></admin-working-item>
                <admin-working-item day="sunday" @add="add" title="Pazar" :working="sunday"></admin-working-item>


            </div>
        </div>
    </div>


</template>

<script>
    export default {
        data() {
            return {
                selectedTables: [],
                monday: [],
                tuesday: [],
                wednesday: [],
                thursday: [],
                friday: [],
                saturday: [],
                sunday: [],
            }
        },
        created() {

            axios.get('http://localhost/api/working-list/').then((res) => {

                this.monday = (typeof res.data.monday !== 'undefined') ? res.data.monday : [];
                this.tuesday = (typeof res.data.tuesday !== 'undefined') ? res.data.tuesday : [];
                this.wednesday = (typeof res.data.wednesday !== 'undefined') ? res.data.wednesday : [];
                this.thursday = (typeof res.data.thursday !== 'undefined') ? res.data.thursday : [];
                this.friday = (typeof res.data.friday !== 'undefined') ? res.data.friday : [];
                this.saturday = (typeof res.data.saturday !== 'undefined') ? res.data.saturday : [];
                this.sunday = (typeof res.data.sunday !== 'undefined') ? res.data.sunday : [];


            })


        },
        methods: {
            add: function (data) {

                axios.get('http://localhost/api/working-list/').then((res) => {

                    this.monday = (typeof res.data.monday !== 'undefined') ? res.data.monday : [];
                    this.tuesday = (typeof res.data.tuesday !== 'undefined') ? res.data.tuesday : [];
                    this.wednesday = (typeof res.data.wednesday !== 'undefined') ? res.data.wednesday : [];
                    this.thursday = (typeof res.data.thursday !== 'undefined') ? res.data.thursday : [];
                    this.friday = (typeof res.data.friday !== 'undefined') ? res.data.friday : [];
                    this.saturday = (typeof res.data.saturday !== 'undefined') ? res.data.saturday : [];
                    this.sunday = (typeof res.data.sunday !== 'undefined') ? res.data.sunday : [];


                })

            }
        }
    }


</script>
