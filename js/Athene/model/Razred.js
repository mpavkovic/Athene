Ext.define('Athene.model.Razred', {
    extend: 'Ext.data.Model',
    proxy: {
        type: 'direct',
        api: {
            create: Razred.create,
            read: Razred.read,
            update: Razred.update,
            destroy: Razred.destroy
        },
        reader: {
            root: 'data'
        }
    },
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