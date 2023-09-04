"""initial migration

Revision ID: 9b57a105363b
Revises: 
Create Date: 2023-08-25 06:02:14.447449

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9b57a105363b'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.add_column(sa.Column('username', sa.String(length=40), nullable=False))
        batch_op.add_column(sa.Column('password', sa.String(length=50), nullable=False))
        batch_op.create_unique_constraint(None, ['username'])
        batch_op.drop_column('name')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.add_column(sa.Column('name', sa.VARCHAR(length=40), autoincrement=False, nullable=False))
        batch_op.drop_constraint(None, type_='unique')
        batch_op.drop_column('password')
        batch_op.drop_column('username')

    # ### end Alembic commands ###
