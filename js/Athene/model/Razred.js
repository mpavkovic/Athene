Ext.define('Athene.model.Razred', {
    extend: 'Ext.data.Model',
    fields: [
        'id',
        'naziv',
        'skolska_godina_id',
        'razred',
        'razrednik_id',
        'razrednik_ime',
        'razrednik_prezime',
        'klasa',
        'urudzbeni_broj'
    ]
});