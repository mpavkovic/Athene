Ext.define('Athene.store.SlobodnaAktivnost', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.SlobodnaAktivnost',
    proxy: {
        type: 'direct',
        directFn: SlobodnaAktivnost.getAll
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});