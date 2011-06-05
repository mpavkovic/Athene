Ext.define('Athene.model.Predmet', {
    extend: 'Ext.data.Model',
    proxy: {
        type: 'direct',
        api: {
            create: Predmet.save,
            read: Predmet.getAll,
            update: Predmet.update,
            destroy: Predmet.del
        },
        reader: {
            root: 'data'
        }
    },
    fields: ['id','naziv','opis','razred','previdjen_broj_sati']
});