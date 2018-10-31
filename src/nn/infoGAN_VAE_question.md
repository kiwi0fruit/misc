# How good are InfoGAN and VAE for continuous latent variables with unbalanced database? (more details and specific DB are in the post)

Assuming we have a psychological survey database that contains continuous and non-linear dependencies. But people with different personality traits are imbalanced in the database: some kind of people almost never consider taking a survey and some other kinds like to take the survey.

And there is an external tool that is a rough approximation that can classify survey entities into discrete classes (but in reality there is no discrete classes!). And some classes have ten times more samples than other. And... I guess this can help to balance the DB somehow.

Are InfoGAN or VAE capable of learning balanced latent variable space as if the original database was balanced (or close to this)? Do you have any advice on approach how to balance?
