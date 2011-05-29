Ext.define('Athene.model.Ucitelj', {
    extend: 'Ext.data.Model',
    fields: [
        'id',
        'ime',
        'prezime',
        'telefon',
        'email',
        'titula_prefix_id',
        'titula_prefix',
        'titula_sufix_id',
        'titula_sufix'
    ]
});