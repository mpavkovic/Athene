Ext.define('Athene.model.Adresa', {
    extend: 'Ext.data.Model',
    proxy: {
        type: 'direct',
        api: {
            create: Adresa.save,
            read: Adresa.getAll,
            update: Adresa.update,
            destroy: Adresa.del
        },
        reader: {
            root: 'data'
        }
    },
    fields: [
             'id',
             'tip_adrese',
             'ulica',
             'broj',
             'datum_od',
             'datum_do',
             'telefon',
             'mobitel',
             'stanuje_s',
             'ucenik_id',
             'ucenik',
             'mjesto_id',
             'mjesto',
             'razlog_boravista_id'
             ],
    belongsTo: [
        'Ucenik',
        'Mjesto'           
    ]
});