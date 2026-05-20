from __future__ import annotations
from sqlalchemy import (
    ForeignKey,
    Integer,
    String,
    Boolean,
    DateTime,
    create_engine,
)
from sqlalchemy.orm import (
    relationship,
    DeclarativeBase,
    Session,
    Mapped,
    mapped_column,
)
from datetime import datetime, UTC
